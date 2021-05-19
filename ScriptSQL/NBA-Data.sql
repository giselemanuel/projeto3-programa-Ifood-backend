create table players_names(
	PLAYER_NAME varchar(255),
	PLAYER_ID int primary key
);


create table games(
	GAME_DATE_EST date,
	GAME_ID int primary key,
	GAME_STATUS_TEXT varchar(100),
	HOME_TEAM_ID int,
	VISITOR_TEAM_ID int, 
	SEASON int, 
	TEAM_ID_home int,
	PTS_home decimal,
	FG_PCT_home decimal,
	FT_PCT_home decimal, 
	FG3_PCT_home decimal, 
	AST_home decimal,
	REB_home decimal,
	TEAM_ID_away int,
	PTS_away decimal,
	FG_PCT_away decimal, 
	FT_PCT_away decimal,
	FG3_PCT_away decimal,
	AST_away decimal,
	REB_away decimal, 
	HOME_TEAM_WINS int
);


create table teams(
	LEAGUE_ID int,
	TEAM_ID int primary key,
	MIN_YEAR int, 
	MAX_YEAR int, 
	ABBREVIATION varchar(50),
	NICKNAME varchar(150),
	YEARFOUNDED int,
	CITY varchar(150),
	ARENA varchar(255),
	ARENACAPACITY int,
	OWNER varchar(255),
	GENERALMANAGER varchar(255),
	HEADCOACH varchar(255),
	DLEAGUEAFFILIATION varchar(255)
);


create table players_teams(
	PLAYER_NAME varchar(255),
	TEAM_ID integer, 
	PLAYER_ID int, 
	SEASON int,
	foreign key (TEAM_ID) references teams(TEAM_ID),
	foreign key (PLAYER_ID) references players_names(PLAYER_ID)
);


create table ranking(
	TEAM_ID int,
	LEAGUE_ID int, 
	SEASON_ID int, 
	STANDINGSDATE date,
	CONFERENCE varchar(50),
	TEAM varchar(255),
	G int,
	W int,
	L int, 
	W_PCT decimal,
	HOME_RECORD varchar(50),
	ROAD_RECORD varchar(50),
	foreign key (TEAM_ID) references teams(TEAM_ID)
);


create table games_details(
	GAME_ID integer, 
	TEAM_ID integer, 
	TEAM_ABBREVIATION varchar(100),
	TEAM_CITY varchar(150),
	PLAYER_ID integer, 
	PLAYER_NAME varchar(255),
	START_POSITION char,
	COMMENT varchar(150),
	MIN varchar(255),
	FGM decimal,
	FGA decimal,
	FG_PCT decimal,
	FG3M decimal,
	FG3A decimal,
	FG3_PCT decimal,
	FTM decimal,
	FTA decimal, 
	FT_PCT decimal,
	OREB decimal, 
	DREB decimal,
	REB decimal,
	AST decimal,
	STL decimal, 
	BLK decimal, 
	TO_ decimal,
	PF decimal,
	PTS decimal,
	PLUS_MINUS decimal,
	foreign key (GAME_ID) references games(GAME_ID),
	foreign key (TEAM_ID) references teams(TEAM_ID),
	foreign key (PLAYER_ID) references players_names(PLAYER_ID)
);


------ Remover as tabelas ---------

drop table players_names cascade;
drop table players_teams cascade;
drop table games cascade;
drop table games_details cascade;
drop table ranking cascade;
drop table teams cascade;

---- Para fazer a carga no  Dbeaver ---

copy games
from '/home/games.csv' csv header;

copy teams
from '/home/teams.csv' csv header;

copy ranking
from '/home/ranking.csv' csv header;

copy players_names
from '/home/players_names.csv' csv header;

copy players_teams
from '/home/players_teams.csv' csv header;

copy games_details
from '/home/games_details.csv' with DELIMITER ',' NULL '' CSV HEADER QUOTE;


--- Para incluir o CSV no docker ---

docker cp /Users/giselerodrigues/Git/projeto3-programa-Ifood-backend/Data-Base/NBA-data/games_details.csv db_postgres:/home
docker cp /Users/giselerodrigues/Git/projeto3-programa-Ifood-backend/Data-Base/NBA-data/players_names.csv db_postgres:/home
docker cp /Users/giselerodrigues/Git/projeto3-programa-Ifood-backend/Data-Base/NBA-data/players_teams.csv db_postgres:/home
docker cp /Users/giselerodrigues/Git/projeto3-programa-Ifood-backend/Data-Base/NBA-data/games.csv db_postgres:/home
docker cp /Users/giselerodrigues/Git/projeto3-programa-Ifood-backend/Data-Base/NBA-data/ranking.csv db_postgres:/home
docker cp /Users/giselerodrigues/Git/projeto3-programa-Ifood-backend/Data-Base/NBA-data/teams.csv db_postgres:/home

---- Exibir todos os registros da tabela -----

select * from players_names p ;

select * from players_names cp;

select * from games g ;

select * from games_details gd ;

select * from ranking r ;

select * from teams t ;

