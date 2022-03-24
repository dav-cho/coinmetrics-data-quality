import requests
from datetime import datetime, timedelta
from collections import defaultdict, OrderedDict


# Global parameters for API calls
EXCHANGE = "binance"
TIME_OFFSET = 5  # in minutes

# Globals for accessing API response objects
DATA_KEY = "data"
MARKET_KEY = "market"
NEXT_URL_KEY = "next_page_url"
ID_KEY = "coin_metrics_id"
TIME_KEY = "time"


class Time:
    def __init__(self):
        self.start = datetime.utcnow() - timedelta(minutes=TIME_OFFSET)

    @staticmethod
    def format_iso_to_datetime(iso_date):
        format = "%Y-%m-%dT%H:%M:%S.%f"
        if len(iso_date) > 26:
            iso_date = iso_date[:26]

        return datetime.strptime(iso_date, format)


class API:
    def __init__(self, start_time):
        self.markets = []
        self.all_trades = []
        self.trades_by_market = defaultdict(list)
        self.invalid_markets = set()
        self.empty_markets = []

        self._get_markets()
        self._get_all_market_trades(start_time)
        self._parse_trades()

    def _get_markets(self):
        """Get all available markets for a given exchange."""

        BASE_URL = "https://community-api.coinmetrics.io/v4/catalog/markets"

        response = requests.get(f"{BASE_URL}?exchange={EXCHANGE}")
        print("~ GET MARKETS RESPONSE STATUS:", response.status_code)

        if response.ok:
            response_json = response.json(object_pairs_hook=OrderedDict)
            data = response_json.get(DATA_KEY)
            for market in data:
                self.markets.append(market[MARKET_KEY])

    def _get_all_market_trades(self, start_time):
        """Get all trades for the given exchange in the given time offset."""

        BASE_URL = "https://community-api.coinmetrics.io/v4/timeseries/market-trades"
        PAGE_SIZE = 10000

        # Get initial (first page) response/data
        initial_response = requests.get(
            f"{BASE_URL}?markets={EXCHANGE}-*&start_time={start_time.isoformat()}&page_size={PAGE_SIZE}"
        )
        print(f"~ INITIAL RESPONSE STATUS:", initial_response.status_code)

        if initial_response.ok:
            response_json = initial_response.json(object_pairs_hook=OrderedDict)
            first_page = response_json.get(DATA_KEY)
            self.all_trades.extend(first_page)

            # Get all next pages response/data
            next_page_url = response_json.get(NEXT_URL_KEY)
            while next_page_url:
                next_response = requests.get(next_page_url)
                print(f"~ NEXT RESPONSE STATUS:", next_response.status_code)

                if next_response.ok:
                    next_json = next_response.json(object_pairs_hook=OrderedDict)
                    next_page = next_json.get(DATA_KEY)
                    self.all_trades.extend(next_page)
                    next_page_url = next_json.get(NEXT_URL_KEY)

    def _parse_trades(self):
        """Parse all trades by market into the 'self.trades_by_market' table"""

        self.all_trades.sort(key=lambda trade: trade[ID_KEY])

        for trade in self.all_trades:
            market = trade[MARKET_KEY]

            # Precaution in case the API returns a market that is not present
            # in the list of available markets.
            if market not in self.markets:
                self.invalid_markets.add(market)
                continue

            self.trades_by_market[market].append(trade)


class Validate:
    def __init__(self, markets, trades_by_market):
        self.empty_markets = []
        self.missing_trades = {}
        self.invalid_trade_ids = defaultdict(list)
        self.invalid_trade_times = defaultdict(list)

        self._find_empty_markets(markets, trades_by_market)
        self._validate_trades_by_market(trades_by_market)
        self._print_results()

    def _find_empty_markets(self, markets, trades_by_market):
        """Find markets with no trades for the given time period."""

        active_markets = trades_by_market.keys()
        for market in markets:
            if market not in active_markets:
                self.empty_markets.append(market)

    def _validate_trades_by_market(self, trades_by_market):
        """Validate all trades for each market."""

        for market in trades_by_market:
            trades = trades_by_market[market]
            num_trades = len(trades)
            if num_trades == 1:
                continue

            for i in range(num_trades - 1):
                trade_a = trades[i]
                trade_b = trades[i + 1]

                # Validate trade IDs are sequentially ordered.
                trade_id_a = int(trade_a[ID_KEY])
                trade_id_b = int(trade_b[ID_KEY])
                if trade_id_a + 1 != trade_id_b:
                    self.invalid_trade_ids[market].append((trade_a, trade_b))

                # Validate trades are ordered chronologically.
                trade_time_a = Time.format_iso_to_datetime(trade_a[TIME_KEY])
                trade_time_b = Time.format_iso_to_datetime(trade_b[TIME_KEY])
                if trade_time_a > trade_time_b:
                    self.invalid_trade_times[market].append((trade_a, trade_b))

    def _print_results(self):
        """Print validation findings to console."""

        print("------------------------------")
        print(
            "~ Number of markets with no trades in time window:",
            len(self.empty_markets),
        )
        print('~ Markets with no trades:')
        for market in self.empty_markets:
            print(f'~ {market}')

        print('~ Number of markets with out of order IDs:', len(self.invalid_trade_ids))
        for market in self.invalid_trade_ids:
            missing_trades = self.invalid_trade_ids[market]
            print(f"~ {len(missing_trades)} discrepancies found with IDs in {market}")
            for trade_a, trade_b in missing_trades:
                id_a = int(trade_a[ID_KEY])
                id_b = int(trade_b[ID_KEY])
                if id_b - id_a > 2:
                    print(f"~ Missing IDs in range {id_a}-{id_b}")
                else:
                    print(f"~ Missing ID {id_a + 1}")

        print("~ Number of out of order trade times:", len(self.invalid_trade_times))
        print("------------------------------")


class Main:
    def __init__(self):
        self._run()

    def _run(self):
        time = Time()
        api = API(time.start)
        Validate(api.markets, api.trades_by_market)


if __name__ == "__main__":
    Main()
