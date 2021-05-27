-- O time que fez o maior numero de rebotes durante a temporada de 2019? 

select nickname as time, season as temporada, max(reb) as rebotes
from(
select nickname, pt.season, gd.reb
from games_details gd
join teams t on t.team_id = gd.team_id 
join players_teams pt on t.team_id = pt.team_id 
group by 1, 2, 3
) as s
where season = 2019
group by 1, 2
order by 3 desc
limit 10;


-- o numero de vitorias da franquia que LeBron jogou
select distinct g.team_abbreviation, max(r.w), g.player_name
from games_details g
join teams t on g.team_id = t.team_id
join ranking r on t.team_id = r.team_id
where g.player_name like '%LeBron%'
group by 1,3

-- Qual a franquia que teve mais vitorias (toda base)?
-- Unico jeito que consegui fazer 

select 
    team, 
    max(w) as "total de vitorias"
from 
    ranking
group by 1
order by "total de vitorias" desc

-- Select dos campos em games_details :  pts ( pontos) , ast (assistência),  
-- reb (rebotes), blk (bloqueio) para gerar a visão do perfil de jogo do Leblon nas franquias  nas temporadas que ele jogou.

select 
    team_abbreviation, 
    player_name, 
    max(pts) as Pontos, 
    max(ast) as Assistencias, 
    max(reb) as Rebotes, 
    max(blk) as Bloqueios
from 
    games_details
where 
    player_name like 'LeBron James'
group by 1, 2


-- Evolução de Cleveland entre 2003 até 2010/ Lebron James participou da final de 2007, porém perderam para Antonio Spurs

select team, max(w), season_id
from ranking
where team like 'Cleveland' and season_id between 22003 and 22010
group by 1, 3
order by 3

-- Desempenho de vitorias Cleveland depois que Lebron Saiu 2011-2014
select team, max(w), season_id
from ranking
where team like 'Cleveland' and season_id between 22011 and 22014
group by 1, 3
order by 3

-- Desempenho de MIAMI antes de lebron  2003-2010
select team, max(w), season_id
from ranking
where team like 'Miami' and season_id between 22003 and 22010
group by 1, 3
order by 3

-- Desempenho de MIAMI depois que lebron entrou 2011-2014
select team, max(w), season_id
from ranking
where team like 'Miami' and season_id between 22011 and 22014
group by 1, 3
order by 3

-- Desempenho de Los Angeles antes de lebron entrar 2007-2017
select team, max(w), season_id
from ranking
where team like 'L.A. Lakers' and season_id between 22007 and 22017
group by 1, 3
order by 3

-- Desempenho de Los Angeles depois que lebron entrou 2018-2019
select team, max(w), season_id
from ranking
where team like 'L.A. Lakers' and season_id between 22018 and 22019
group by 1, 3
order by 3



-- Total de vitorias das franquias que Nene (Jogador Brasileiro) Jogou
select distinct g.team_abbreviation, max(r.w), g.player_name
from games_details g
join teams t on g.team_id = t.team_id
join ranking r on t.team_id = r.team_id
where g.player_name like 'Nene'
group by 1, 3

-- Campos em games_details :  pts ( pontos) , ast (assistência),  
-- reb (rebotes), blk (bloqueio) para gerar a visão do perfil de jogo do Nene nas franquias  nas temporadas que ele jogou.
select 
    team_abbreviation, 
    player_name, 
    sum(pts) as Pontos, 
    sum(ast) as Assistencias, 
    sum(reb) as Rebotes, 
    sum(blk) as Bloqueios
from 
    games_details
where 
    player_name like 'Nene'
group by 1, 2
