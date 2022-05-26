SELECT min(last_name)
FROM (SELECT city_nm, last_name, gender_cd, average, row_number() OVER (PARTITION BY city_nm ORDER BY average) as num
    FROM (SELECT city_nm, last_name, gender_cd, avg(time) as average
        FROM ((SELECT quest_rk, city_nm
            FROM cource_analytics.quest q
                INNER JOIN cource_analytics.location l
                ON q.location_rk = l.location_rk) q_c
        INNER JOIN (SELECT quest_rk, last_name, gender_cd, time
            FROM cource_analytics.game g
                INNER JOIN cource_analytics.employee e
                    ON g.employee_rk = e.employee_rk) g
        ON q_c.quest_rk = g.quest_rk)
GROUP BY city_nm, last_name, gender_cd) ce) gce
WHERE num = 2 and gender_cd = 'f'
