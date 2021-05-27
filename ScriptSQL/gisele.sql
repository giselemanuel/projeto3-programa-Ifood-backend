-- DESEMPENHO INDIVIDUAL DE LEBRON JAMES.

-- Total de pontos de lebron james(2003-2019)
SELECT PLAYER_ID,player_name,SUM(PTS) AS TOTAL_PONTOS
FROM GAMES_DETAILS
WHERE PLAYER_ID=2403
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_PONTOS;

-- Total de assistências de lebron james(2003-2019)
SELECT PLAYER_ID,player_name,SUM(ast) AS TOTAL_assitencias
FROM GAMES_DETAILS
WHERE PLAYER_ID=2403
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_assitencias;

-- Total de rebotes de lebron james(2003-2019)
SELECT PLAYER_ID,player_name,SUM(reb) AS TOTAL_rebotes
FROM GAMES_DETAILS
WHERE PLAYER_ID=2403
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_rebotes;

-- Total de roubadas de bola de lebron james(2003-2019)
SELECT PLAYER_ID,player_name,SUM(stl) AS TOTAL_roubadas_bola
FROM GAMES_DETAILS
WHERE PLAYER_ID=2403
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_roubadas_bola;

-- Total de bloqueios de Lebron james(2003-2019)
SELECT PLAYER_ID,player_name,SUM(blk) AS TOTAL_bloqueios
FROM GAMES_DETAILS
WHERE PLAYER_ID=2403
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_bloqueios;

-- Total de arremessos convertidos em pontos de Lebron james(2003-2019)
SELECT PLAYER_ID,player_name,SUM(blk) AS TOTAL_bloqueios
FROM GAMES_DETAILS
WHERE PLAYER_ID=2403
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_bloqueios;

---

-- Qual a franquia  que teve mais vitórias na última década ?
-- Lista soma de vitórias por ano de cada franquia 
    -- Miami  2019 69
    -- Lakers 2019 80

select team_id,season_id, standingsdate, w, l
from ranking
where team like 'Miami' and season_id = 22011
group by 1, 2, 3, 4, 5
order by standingsdate desc


-- Lebron James : 
-- No ano anterior ( que ele não estava presente) qual foi o número de vitórias  da franquia na  temporada. ( tb_ranking , coluna W)
    -- CLE 2003 total de vitórias da frun



-- Qual a franquia  que teve mais vitórias na última década ?
-- Lista soma de vitórias por ano de cada franquia 
    -- Miami  2019 69
    -- Lakers 2019 80

-- select team_id,season_id, standingsdate, w, l
-- from ranking
-- where team like 'Miami' and season_id = 22011
-- group by 1, 2, 3, 4, 5
-- order by standingsdate desc


-- -- 2019
-- select team, season_id, max(w) as total
-- from ranking
-- where season_id = 22019
-- -- where season_id between 22003 and 2019
-- group by 1, 2
-- order by total


-- 2018
select team, season_id, max(w) as total
from ranking
where season_id = 22018
-- where season_id between 22003 and 2019
group by 1, 2
order by total
limit 3

--2017
select team, season_id, max(w) as total
from ranking
where season_id = 22018
group by 1, 2
order by total
limit 3
