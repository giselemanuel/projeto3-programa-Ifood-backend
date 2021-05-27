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

-- Qual a franquia que teve mais vitorias na ultima decada?
