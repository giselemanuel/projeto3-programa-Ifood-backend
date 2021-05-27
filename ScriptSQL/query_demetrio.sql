--RANKS DOS JOGADORES DA NBA

-- Os 5 jogadores com maior pontuação.
SELECT PLAYER_ID,player_name,SUM(PTS) AS TOTAL_PONTOS
FROM GAMES_DETAILS
WHERE PTS is not null 
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_PONTOS DESC
LIMIT 10;

-- Os 5 jogadores com as maiores assistências.
SELECT PLAYER_ID,player_name,SUM(ast) AS TOTAL_assistencia
FROM GAMES_DETAILS
WHERE PTS is not null 
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_assistencia DESC
LIMIT 10;

-- Os 5 jogadores com os maiores bloqueios.
SELECT PLAYER_ID,player_name,SUM(blk) AS TOTAL_bloqueio
FROM GAMES_DETAILS
WHERE PTS is not null 
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_bloqueio DESC
LIMIT 10;

-- Os 5 jogadores com os maiores turnovers(erros de bola).
SELECT PLAYER_ID,player_name,SUM(to_) AS TOTAL_turnovers
FROM GAMES_DETAILS
WHERE PTS is not null 
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_turnovers DESC
LIMIT 10;

-- Os 5 jogadores com os maiores rebotes.
SELECT PLAYER_ID,player_name,SUM(reb) AS TOTAL_rebotes
FROM GAMES_DETAILS
WHERE PTS is not null 
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_rebotes DESC
LIMIT 10;

-- Os 5 jogadores com os maiores arremessos convertidos em pontos.
SELECT PLAYER_ID,player_name,SUM(fgm) AS TOTAL_arremesso_convertido
FROM GAMES_DETAILS
WHERE PTS is not null 
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_arremesso_convertido DESC
LIMIT 10;

-- Os 5 jogadores com maior número de Triple Doubles.

SELECT a.player_id,a.player_name, a.team_abbreviation,  
SUM(CASE when a.doubles = 3 then 1 else 0 end) as triple_Doubles
FROM
(SELECT *, 
(case when pts > 9 then 1 else 0 end) +
(case when reb > 9 then 1 else 0 end) +
(case when ast > 9 then 1 else 0 end) +
(case when stl > 9 then 1 else 0 end) +
(case when blk > 9 then 1 else 0  end) as doubles
FROM games_details) a
GROUP BY 1, 2, 3
ORDER BY triple_Doubles DESC
LIMIT 5;




-- DESEMPENHO INDIVIDUAL DE LEBRON JAMES.

-- Total de pontos de lebron james(2003-2019)
SELECT PLAYER_ID,player_name,SUM(PTS) AS TOTAL_PONTOS
FROM GAMES_DETAILS
WHERE PLAYER_ID=2544
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_PONTOS;

-- Total de assistências de lebron james(2003-2019)
SELECT PLAYER_ID,player_name,SUM(ast) AS TOTAL_assitencias
FROM GAMES_DETAILS
WHERE PLAYER_ID=2544
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_assitencias;

-- Total de rebotes de lebron james(2003-2019)
SELECT PLAYER_ID,player_name,SUM(reb) AS TOTAL_rebotes
FROM GAMES_DETAILS
WHERE PLAYER_ID=2544
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_rebotes;

-- Total de roubadas de bola de lebron james(2003-2019)
SELECT PLAYER_ID,player_name,SUM(stl) AS TOTAL_roubadas_bola
FROM GAMES_DETAILS
WHERE PLAYER_ID=2544
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_roubadas_bola;

-- Total de bloqueios de Lebron james(2003-2019)
SELECT PLAYER_ID,player_name,SUM(blk) AS TOTAL_bloqueios
FROM GAMES_DETAILS
WHERE PLAYER_ID=2544
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_bloqueios;

-- Total de arremessos convertidos em pontos de Lebron james(2003-2019)
SELECT PLAYER_ID,player_name,SUM(blk) AS TOTAL_bloqueios
FROM GAMES_DETAILS
WHERE PLAYER_ID=2544
GROUP BY PLAYER_ID,player_name
ORDER BY TOTAL_bloqueios;





