SELECT
  t.trade_id + 1 AS trade_id_start,
  MIN(t2.trade_id) - 1 as trade_id_stop
FROM trades t
LEFT JOIN
  trades t1 on t.trade_id = t1.trade_id - 1
LEFT JOIN
  trades t2 on t.trade_id < t2.trade_id
WHERE
  t1.trade_id IS null
  AND  t2.trade_id IS NOT null
GROUP BY t.trade_id, t1.trade_id
ORDER BY trade_id_start;

