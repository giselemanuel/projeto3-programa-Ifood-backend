create table cad_players(
	PLAYER_NAME varchar(255),
	PLAYER_ID int primary key, 
	foreign key (PLAYER_ID) references players(PLAYER_ID)
);

create table players(
	PLAYER_NAME varchar(255),
	TEAM_ID integer, 
	PLAYER_ID int, 
	SEASON int,
	foreign key (TEAM_ID) references teams(TEAM_ID)
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
	foreign key (PLAYER_ID) references players(PLAYER_ID)
);



---- Para fazer a carga no  Dbeaver ---

copy games
from '/home/games.csv' csv header;

copy teams
from '/home/teams.csv' csv header;

copy ranking
from '/home/ranking.csv' csv header;

copy games_details
from '/home/games_details.csv' csv header;


copy players
from '/home/players.csv' csv header;


copy cad_players
from '/home/cad_players.csv' csv header;



--- Para incluir o CSV no docker ---

docker cp /Users/giselerodrigues/Downloads/NBA-data/cad_players.csv db_postgres:/home

select * from players p ;







