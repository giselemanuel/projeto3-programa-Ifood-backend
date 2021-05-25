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

-- Qual o time que teve o maior numero de home_record na temporada?
