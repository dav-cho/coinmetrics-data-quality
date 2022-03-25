DROP TABLE IF EXISTS trades;

CREATE TABLE trades (
  trade_id BIGINT,
  trade_price NUMERIC,
  trade_amount NUMERIC,
  trade_time TIMESTAMP
);

INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24575995, 0.0003558, 45.4, TO_TIMESTAMP('2022-03-25 13:35:05.076', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24575996, 0.0003558, 25.7, TO_TIMESTAMP('2022-03-25 13:35:15.629', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24575997, 0.000356, 104.6, TO_TIMESTAMP('2022-03-25 13:35:16.134', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24575998, 0.0003557, 25.7, TO_TIMESTAMP('2022-03-25 13:35:46.875', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24575999, 0.0003557, 20, TO_TIMESTAMP('2022-03-25 13:35:53.479', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576000, 0.0003559, 8839.1, TO_TIMESTAMP('2022-03-25 13:36:01.506', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576001, 0.0003559, 20, TO_TIMESTAMP('2022-03-25 13:36:11.440', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576002, 0.000356, 65, TO_TIMESTAMP('2022-03-25 13:36:38.388', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576003, 0.0003561, 382, TO_TIMESTAMP('2022-03-25 13:36:40.139', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576004, 0.0003561, 173, TO_TIMESTAMP('2022-03-25 13:36:40.139', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576005, 0.0003561, 11250, TO_TIMESTAMP('2022-03-25 13:36:52.479', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576006, 0.0003561, 8825.2, TO_TIMESTAMP('2022-03-25 13:36:59.329', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576007, 0.0003561, 1175.6, TO_TIMESTAMP('2022-03-25 13:36:59.345', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576008, 0.0003561, 182.5, TO_TIMESTAMP('2022-03-25 13:36:59.345', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576009, 0.0003561, 2424.8, TO_TIMESTAMP('2022-03-25 13:36:59.345', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576010, 0.0003563, 173, TO_TIMESTAMP('2022-03-25 13:37:02.386', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576011, 0.0003563, 1120.8, TO_TIMESTAMP('2022-03-25 13:37:02.386', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576012, 0.0003563, 1293.7, TO_TIMESTAMP('2022-03-25 13:37:04.386', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576013, 0.0003563, 1293.7, TO_TIMESTAMP('2022-03-25 13:37:05.386', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576014, 0.0003563, 59.9, TO_TIMESTAMP('2022-03-25 13:37:08.401', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576015, 0.0003561, 258.4, TO_TIMESTAMP('2022-03-25 13:37:49.395', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576016, 0.0003561, 240.6, TO_TIMESTAMP('2022-03-25 13:37:49.395', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576017, 0.0003564, 109.6, TO_TIMESTAMP('2022-03-25 13:38:01.586', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576018, 0.0003564, 173, TO_TIMESTAMP('2022-03-25 13:38:01.586', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576019, 0.0003564, 977.7, TO_TIMESTAMP('2022-03-25 13:38:01.586', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576020, 0.0003564, 1260.6, TO_TIMESTAMP('2022-03-25 13:38:06.987', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576021, 0.0003564, 1386.6, TO_TIMESTAMP('2022-03-25 13:38:06.989', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576022, 0.0003565, 395.7, TO_TIMESTAMP('2022-03-25 13:38:26.964', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576023, 0.0003565, 67, TO_TIMESTAMP('2022-03-25 13:38:26.964', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576024, 0.0003565, 84.1, TO_TIMESTAMP('2022-03-25 13:38:26.964', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576025, 0.0003565, 21.3, TO_TIMESTAMP('2022-03-25 13:38:26.964', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576026, 0.0003565, 173, TO_TIMESTAMP('2022-03-25 13:38:26.964', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576027, 0.0003565, 518.9, TO_TIMESTAMP('2022-03-25 13:38:26.964', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576028, 0.0003565, 1259.9, TO_TIMESTAMP('2022-03-25 13:38:26.965', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576029, 0.0003565, 8816, TO_TIMESTAMP('2022-03-25 13:38:32.409', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576030, 0.0003563, 10838.5, TO_TIMESTAMP('2022-03-25 13:38:47.376', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576031, 0.0003563, 411.5, TO_TIMESTAMP('2022-03-25 13:38:47.383', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576032, 0.0003562, 995.1, TO_TIMESTAMP('2022-03-25 13:38:55.637', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576033, 0.0003561, 19.6, TO_TIMESTAMP('2022-03-25 13:39:03.366', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576034, 0.0003561, 20, TO_TIMESTAMP('2022-03-25 13:39:09.817', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576035, 0.0003562, 373.4, TO_TIMESTAMP('2022-03-25 13:39:11.350', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576036, 0.0003563, 10.6, TO_TIMESTAMP('2022-03-25 13:39:11.350', 'YYYY-MM-DD HH24:MI:SS.FF3'));
-- INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576037, 0.0003563, 384.1, TO_TIMESTAMP('2022-03-25 13:39:13.350', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO trades (trade_id, trade_price, trade_amount, trade_time) VALUES (24576038, 0.0003563, 384.1, TO_TIMESTAMP('2022-03-25 13:39:14.350', 'YYYY-MM-DD HH24:MI:SS.FF3'));