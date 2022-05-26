with jan as (
    SELECT quest_rk, game_flg, count(*)
    FROM cource_analytics.game
    WHERE EXTRACT(MONTH FROM game_dttm) = 1
    GROUP BY quest_rk, game_flg),
feb as (
    SELECT quest_rk, game_flg, count(*)
    FROM cource_analytics.game
    WHERE EXTRACT(MONTH FROM game_dttm) = 2
    GROUP BY quest_rk, game_flg)


SELECT g.quest_rk, quest_nm, delta
FROM (
    SELECT j.quest_rk, abs(j.share - f.share) as delta
    FROM (
        SELECT jan.quest_rk, cast(jan.count as double precision) / cast((jan.count + x.count) as double precision) as share
        FROM jan
            INNER JOIN jan x ON
                jan.quest_rk = x.quest_rk and
                jan.game_flg = 1 and x.game_flg = 0) j
            INNER JOIN (SELECT feb.quest_rk, cast(feb.count as double precision) / cast((feb.count + x.count) as double precision) as share
                FROM feb
                    INNER JOIN feb x ON
                        feb.quest_rk = x.quest_rk and
                        feb.game_flg = 1 and x.game_flg = 0) f ON f.quest_rk = j.quest_rk) g
    INNER JOIN cource_analytics.quest q ON g.quest_rk = q.quest_rk
ORDER BY 3 desc, 1 desc
LIMIT 1
