-- Total de Franquias ?

Select count(*)
from teams

-- Qual a franquia que obteve o recorde de maior número de vitórias dentre as temporadas de 2003 a 2019

select 
    team,
    max(w) as "total de vitorias"
from 
    ranking
group by 1
order by "total de vitorias" desc
limit 30


-- Qual a franquia que obteve o recorde maior númeo de vitória e derrota nas temporadas de 2003 a 2019
select team, max(l) as derrota, max(w) as vitoria
from ranking
group by 1
order by vitoria desc


-- o numero de vitorias da franquia que LeBron jogou
select distinct g.team_abbreviation, max(r.w), g.player_name
from games_details g
join teams t on g.team_id = t.team_id
join ranking r on t.team_id = r.team_id
where g.player_name like '%LeBron%'
group by 1,3


-- Campos em games_details :  pts ( pontos) , ast (assistência),  
-- reb (rebotes), blk (bloqueio) para gerar a visão do perfil de jogo do Nene nas franquias nas temporadas que ele jogou.
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
    player_name like 'Nene' or player_name like 'LeBron James'
group by 1, 2
order by player_name


-- Perfil de Jogo Lebron James no CLE
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
    player_name like 'LeBron James' and team_abbreviation like 'CLE' 
group by 1, 2


-- Perfil de Jogo Lebron James no MIA
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
    player_name like 'LeBron James' and team_abbreviation like 'MIA' 
group by 1, 2

-- Perfil de Jogo Lebron James no LAL
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
    player_name like 'LeBron James' and team_abbreviation like 'LAL' 
group by 1, 2


-- Perfil time Cleveland antes e depois de LeBron James

select team, max(w) as Vitorias, season_id as Ano
from ranking
where team like 'Cleveland' and season_id between 22013 and 22015
group by 1, 3
order by 3

-- Perfil time Miami antes e depois de LeBron James

select team, max(w) as Vitorias, season_id as Ano
from ranking
where team like 'Miami' and season_id between 22009 and 22011
group by 1, 3
order by 3

-- Perfil time Los Angeles antes e depois de LeBron James

select team, max(w) as Vitorias, season_id as Ano
from ranking
where team like 'L.A. Lakers' and season_id between 22017 and 22019
group by 1, 3
order by 3
