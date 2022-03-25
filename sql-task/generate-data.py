import os
import requests
from datetime import datetime, timedelta
from collections import defaultdict, OrderedDict

EXCHANGE = "binance"
TIME_OFFSET = 5  # in minutes
DIRECTORY = "mock-data"

NEXT_URL_KEY = "next_page_url"
ID_KEY = "coin_metrics_id"


DB_NAME = "coin-metrics"
DB_USER = "dav"

SCHEMA = """DROP TABLE IF EXISTS trades;

CREATE TABLE trades (
  trade_id BIGINT,
  trade_price NUMERIC,
  trade_amount NUMERIC,
  trade_time TIMESTAMP
);"""
INSERT = "INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES"


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
        self.invalid_markets = 0

        self._get_markets()
        self._get_all_market_trades(start_time)
        self._parse_trades()

    def _get_markets(self):
        """Get all available markets for a given exchange."""

        BASE_URL = "https://community-api.coinmetrics.io/v4/catalog/markets"

        response = requests.get(f"{BASE_URL}?exchange={EXCHANGE}")
        response_status = response.status_code
        print("~ GET MARKETS RESPONSE STATUS:", response_status)

        if response.ok:
            response_json = response.json(object_pairs_hook=OrderedDict)
            data = response_json.get("data")
            for market in data:
                self.markets.append(market["market"])

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
            first_page = response_json.get("data")
            self.all_trades.extend(first_page)

            # Get all next pages response/data
            next_page_url = response_json.get(NEXT_URL_KEY)
            while next_page_url:
                next_response = requests.get(next_page_url)
                print(f"~ NEXT RESPONSE STATUS:", next_response.status_code)

                if next_response.ok:
                    next_json = next_response.json(object_pairs_hook=OrderedDict)
                    next_page = next_json["data"]
                    self.all_trades.extend(next_page)
                    next_page_url = next_json.get(NEXT_URL_KEY)

    def _parse_trades(self):
        """Parse all trades by market into the 'self.trades_by_market' table"""

        self.all_trades.sort(key=lambda trade: trade[ID_KEY])

        for trade in self.all_trades:
            market = trade["market"]
            formatted_trade = {
                "trade_id": trade[ID_KEY],
                "trade_price": trade["price"],
                "trade_amount": trade["amount"],
                "trade_time": trade["time"][:23].replace("T", " "),
            }

            # Precaution in case the API returns a market that is not present
            # in the list of available markets.
            if market not in self.markets:
                self.invalid_markets += 1
                continue

            self.trades_by_market[market].append(formatted_trade)


class Files:
    def __init__(self, trades_by_market):
        self.empty_markets = 0
        self.directories = []
        self._write(trades_by_market)

    def _write(self, trades_by_market):
        curr_path = os.path.dirname(__file__)
        dir_count = str(1).zfill(2)
        dir_path = os.path.join(curr_path, f"{DIRECTORY}-{dir_count}")

        # Find the directory count
        while os.path.isdir(dir_path):
            self.directories.append(dir_path)
            curr_count = int(dir_path.split("-")[-1])
            dir_count = str(curr_count + 1).zfill(2)
            dir_path = os.path.join(curr_path, f"{DIRECTORY}-{dir_count}")

        # Create directory if one does not exist.
        if not os.path.isdir(dir_path):
            os.mkdir(dir_path)
            self.directories.append(dir_path)

        # Write to files
        for market in trades_by_market:
            trades = trades_by_market[market]
            if len(trades) == 0:
                self.empty_markets += 1
                continue

            file = os.path.join(dir_path, market + ".sql")
            with open(file, "w") as sql_file:
                sql_file.write(SCHEMA)
                sql_file.write("\n")
                num_trades = len(trades)
                for i in range(num_trades):
                    trade = trades[i]
                    id = trade["trade_id"]
                    price = trade["trade_price"]
                    amount = trade["trade_amount"]
                    time = trade["trade_time"]

                    quarter = num_trades // 4
                    half = quarter * 2
                    gaps = [
                        quarter,
                        quarter + 1,
                        half,
                        half + 1,
                        half + 2,
                        half + 3,
                        quarter * 3,
                        num_trades - 2,
                    ]
                    if i in gaps:
                        sql_file.write(
                            f"\n-- {INSERT} ({id}, {price}, {amount}, TO_TIMESTAMP('{time}', 'YYYY-MM-DD HH24:MI:SS.FF3'));"
                        )
                    else:
                        sql_file.write(
                            f"\n{INSERT} ({id}, {price}, {amount}, TO_TIMESTAMP('{time}', 'YYYY-MM-DD HH24:MI:SS.FF3'));"
                        )


class Main:
    def __init__(self):
        self._run()

    def _run(self):
        time = Time()
        api = API(time.start)
        Files(api.trades_by_market)


if __name__ == "__main__":
    Main()
