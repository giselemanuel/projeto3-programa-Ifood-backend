
-- DESEMPENHO INDIVIDUAL DE NENE HILÁRIO

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


--