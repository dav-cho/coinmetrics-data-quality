import unittest
from python_task import (
    Time,
    API,
    Validate,
    EXCHANGE,
    TIME_KEY,
    MARKET_KEY,
    ID_KEY,
)
from datetime import datetime

time = Time()
api = API(time.start)
validate = Validate(api.markets, api.trades_by_market)


class Test(unittest.TestCase):
    def test_api_get_markets(self):
        self.assertGreater(len(api.markets), 0)

        for market in api.markets:
            exchange = market.split("-")[0]
            self.assertEqual(exchange, EXCHANGE)

    def test_api_get_all_market_trades(self):
        num_trades = len(api.all_trades)
        self.assertGreater(num_trades, 0)

        now = datetime.utcnow()
        for trade in api.all_trades:
            trade_time = time.format_iso_to_datetime(trade[TIME_KEY])
            self.assertLessEqual(time.start, trade_time)
            self.assertGreaterEqual(now, trade_time)

    def test_api_parse_trades(self):
        for market in api.trades_by_market:
            trades = api.trades_by_market[market]
            num_trades = len(trades)
            self.assertGreater(num_trades, 0)
            for trade in trades:
                trade_market = trade[MARKET_KEY]
                self.assertEqual(market, trade_market)

    def test_validate_find_empty_markets(self):
        num_empty_markets = len(validate.empty_markets)
        self.assertGreaterEqual(num_empty_markets, 0)

        total_markets = len(validate.empty_markets) + len(api.trades_by_market.keys())
        self.assertEqual(len(api.markets), total_markets)

    def test_validate_trades_by_market(self):
        num_invalid_trade_ids = len(validate.invalid_trade_ids)
        num_invalid_trade_times = len(validate.invalid_trade_times)
        self.assertGreaterEqual(num_invalid_trade_ids, 0)
        self.assertGreaterEqual(num_invalid_trade_times, 0)

        for market in validate.invalid_trade_ids:
            for trade_a, trade_b in validate.invalid_trade_ids[market]:
                id_a = int(trade_a[ID_KEY])
                id_b = int(trade_b[ID_KEY])
                for trade in api.all_trades:
                    trade_id = trade[ID_KEY]
                    for id in range(id_a + 1, id_b):
                        self.assertNotEqual(id, trade_id)


if __name__ == "__main__":
    unittest.main()
