SELECT count(*)
FROM
    (SELECT DISTINCT lg.partner_rk
    FROM cource_analytics.legend lg
        LEFT OUTER JOIN cource_analytics.location ln ON
            lg.partner_rk = ln.partner_rk
    WHERE location_rk is NULL) UNQ_P_RK
