DROP TABLE IF EXISTS trades;

CREATE TABLE trades (
  trade_id BIGINT,
  trade_price NUMERIC,
  trade_amount NUMERIC,
  trade_time TIMESTAMP
);

INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486451, 6.66, 18.1, TO_TIMESTAMP('2022-03-25 10:43:42.861', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486452, 6.66, 60.8, TO_TIMESTAMP('2022-03-25 10:43:42.861', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486453, 6.66, 26.9, TO_TIMESTAMP('2022-03-25 10:43:42.861', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486454, 6.66, 16.3, TO_TIMESTAMP('2022-03-25 10:43:42.861', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486455, 6.66, 13.6, TO_TIMESTAMP('2022-03-25 10:43:42.861', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486456, 6.65, 13, TO_TIMESTAMP('2022-03-25 10:43:58.476', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486457, 6.65, 14, TO_TIMESTAMP('2022-03-25 10:44:04.931', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486458, 6.66, 18.1, TO_TIMESTAMP('2022-03-25 10:44:44.908', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486459, 6.66, 16.3, TO_TIMESTAMP('2022-03-25 10:44:44.908', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486460, 6.66, 26.9, TO_TIMESTAMP('2022-03-25 10:44:44.908', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486461, 6.66, 60.8, TO_TIMESTAMP('2022-03-25 10:44:44.908', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486462, 6.66, 13.9, TO_TIMESTAMP('2022-03-25 10:44:44.908', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486463, 6.66, 12.7, TO_TIMESTAMP('2022-03-25 10:45:01.252', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486464, 6.65, 60.8, TO_TIMESTAMP('2022-03-25 10:45:16.452', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486465, 6.65, 16.3, TO_TIMESTAMP('2022-03-25 10:45:16.452', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486466, 6.65, 26.9, TO_TIMESTAMP('2022-03-25 10:45:16.452', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486467, 6.65, 18.1, TO_TIMESTAMP('2022-03-25 10:45:16.452', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486468, 6.65, 13.9, TO_TIMESTAMP('2022-03-25 10:45:16.452', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486469, 6.64, 24.7, TO_TIMESTAMP('2022-03-25 10:45:59.086', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486470, 6.64, 14, TO_TIMESTAMP('2022-03-25 10:46:00.857', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486471, 6.64, 0.6, TO_TIMESTAMP('2022-03-25 10:46:01.048', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486472, 6.65, 60.8, TO_TIMESTAMP('2022-03-25 10:46:41.700', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486473, 6.65, 26.9, TO_TIMESTAMP('2022-03-25 10:46:41.700', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486474, 6.65, 18.1, TO_TIMESTAMP('2022-03-25 10:46:41.700', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486475, 6.65, 16.2, TO_TIMESTAMP('2022-03-25 10:46:41.700', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486476, 6.64, 14.8, TO_TIMESTAMP('2022-03-25 10:47:00.090', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486477, 6.64, 0.2, TO_TIMESTAMP('2022-03-25 10:47:00.113', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486478, 6.63, 14.8, TO_TIMESTAMP('2022-03-25 10:47:00.113', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486479, 6.64, 15, TO_TIMESTAMP('2022-03-25 10:47:06.643', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486480, 6.64, 10.5, TO_TIMESTAMP('2022-03-25 10:47:16.803', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486481, 6.64, 16.4, TO_TIMESTAMP('2022-03-25 10:47:16.852', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486482, 6.64, 60.8, TO_TIMESTAMP('2022-03-25 10:47:16.852', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486483, 6.64, 18.1, TO_TIMESTAMP('2022-03-25 10:47:16.852', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486484, 6.64, 16.2, TO_TIMESTAMP('2022-03-25 10:47:16.852', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486485, 6.64, 14.5, TO_TIMESTAMP('2022-03-25 10:47:16.852', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486486, 6.64, 14.5, TO_TIMESTAMP('2022-03-25 10:47:36.082', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486487, 6.64, 60.8, TO_TIMESTAMP('2022-03-25 10:47:36.082', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486488, 6.64, 18.1, TO_TIMESTAMP('2022-03-25 10:47:36.082', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486489, 6.64, 26.9, TO_TIMESTAMP('2022-03-25 10:47:36.082', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486490, 6.64, 15.7, TO_TIMESTAMP('2022-03-25 10:47:36.082', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486491, 6.64, 0.5, TO_TIMESTAMP('2022-03-25 10:48:01.662', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486492, 6.64, 12.7, TO_TIMESTAMP('2022-03-25 10:48:01.662', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486493, 6.64, 13.1, TO_TIMESTAMP('2022-03-25 10:48:06.640', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486494, 6.64, 14.3, TO_TIMESTAMP('2022-03-25 10:48:06.659', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486495, 6.64, 15.7, TO_TIMESTAMP('2022-03-25 10:48:06.659', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486496, 6.64, 60.8, TO_TIMESTAMP('2022-03-25 10:48:06.659', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486497, 6.64, 18.1, TO_TIMESTAMP('2022-03-25 10:48:06.659', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486498, 6.64, 15, TO_TIMESTAMP('2022-03-25 10:48:06.659', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (486499, 6.63, 13.1, TO_TIMESTAMP('2022-03-25 10:48:06.659', 'YYYY-MM-DD HH24:MI:SS.FF3'));
