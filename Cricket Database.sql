create database cricket;

use cricket;

create table Player(
    PlayerID int primary key,
    PlayerName varchar(50) not null,
    Age int not null,
    Gender varchar(10) not null,
    Role  varchar(50) not null,
    Country varchar(50) not null
)

Insert into Player values
(1,'dhoni',45,'M','wicker keeper batsman','India'),
(2,'kane williamson',35,'M','batsman','Newzealand'),
(3,'gaikwad',28,'M','batsman','India'),
(4,'virat',37,'M','batsman','England'),
(5,'starc',33,'M','bowler','Australia'),
(6,'abhisekh',23,'M','batsman','India'),
(7,'nitish',22,'M','allrounder','India'),
(8,'tilak',24,'M','allrounder','India'),
(9,'dewald brevis',24,'M','batsman','South Africa'),
(10,'Jasprit Bumrah',32,'M','bowler','India'),
(11,'Jos buttler',33,'M','batsman','England'),
(12,'Pathirana',25,'M','bowler','sri lanka');




create table TEAM(
    TeamID int primary key,
    TeamName varchar(50) not null,
    Country varchar(50) not null,
    Coach varchar(50) not null,
    Ranking int not null
)
insert into TEAM values
(101,'India','India','Rahul Dravid',2),
(102,'Australia','Australia','Andrew McDonald',5),
(103,'England','England','Brendon McCullum',8),
(104,'Pakistan','Pakistan','Jason Gillespie',12),
(105,'South Africa','South Africa','Shukri Conrad',18),
(106,'New Zealand','New Zealand','Gary Stead',20);


create table Match(
    MatchID int primary key,
    Team1ID int ,
    Team2ID int,
    MatchDate date ,
    Venue varchar(50),
    Matchtype varchar(50),    
    WinnerID int 
)
insert into Match values
(201,101,102,'2026-01-10','Mumbai','T20',101),
(202,102,103,'2026-01-15','Sydney','ODI',102),
(203,101,103,'2026-02-05','Delhi','T20',103),
(204,104,105,'2026-02-12','Lahore','Test',104),
(205,101,106,'2026-03-01','Chennai','T20',101),
(206,105,102,'2026-03-10','Cape Town','ODI',102),
(207,103,106,'2026-03-20','London','T20',103),
(208,101,104,'2026-04-02','Hyderabad','T20',101);


create table MatchPerformance(
    PerformanceId int primary key,
    MatchID int ,
    PlayerID int,
    Runs int not null,
    Wickets int not null,
    Catches int not null

)
insert into MatchPerformance values
(301,201,1,85,0,2),
(302,201,4,15,3,1),
(303,201,2,70,1,2),
(304,201,5,25,0,1),
(305,202,2,90,0,1),
(306,202,10,12,4,0),
(307,202,6,55,2,3),
(308,203,3,65,0,2),
(309,203,7,78,0,1),
(310,203,4,20,3,2),
(311,204,8,120,1,4),
(312,204,9,80,0,2),
(313,204,12,45,3,1),
(314,205,1,60,0,1),
(315,205,4,10,4,0),
(316,205,11,75,0,2),
(317,206,5,110,0,3),
(318,206,10,30,3,1),
(319,206,12,40,2,2),
(320,207,6,70,2,1),
(321,207,11,85,1,3),
(322,207,10,20,3,0),
(323,208,7,95,0,2),
(324,208,4,25,5,1),
(325,208,1,55,0,3);

create table MatchOfficial(
    OfficialID int primary key,
    OfficialName varchar(50) not null,
    Role varchar(50) not null,
    Country varchar(50) not null,
    MatchId int
)
insert into MatchOfficial values
(401,'Richard Kettleborough','Umpire','England',201),
(402,'Nitin Menon','Umpire','India',202),
(403,'Kumar Dharmasena','Umpire','Sri Lanka',203),
(404,'Aleem Dar','Umpire','Pakistan',204),
(405,'Joel Wilson','Umpire','West Indies',205),
(406,'Marais Erasmus','Umpire','South Africa',206),
(407,'Paul Reiffel','Umpire','Australia',207),
(408,'Chris Gaffaney','Umpire','New Zealand',208);

select * from Player
select * from TEAM
select * from Match
select * from MatchPerformance
select * from MatchOfficial

select PlayerName,Country from Player
where Role='Batsman' and Age>25;

select PlayerName from Player
where country = 'India' or Country = 'Australia' and Age<30;

select * from TEAM 
where Ranking<=10 and Country='India';

select MatchID,Venue,Matchtype from Match
where Matchtype='T20' and Venue='Mumbai';

select PlayerID,Runs,Wickets from MatchPerformance
where Runs>50 or Wickets>2;

select distinct Country from Player;

select distinct Matchtype from Match;

select PlayerName from Player
where PlayerName like 'S%' and Country='India';

select count(*) as TotalPlayers from Player
where Country='India';

select max(Runs) as MaximumRuns from MatchPerformance;

select avg(Runs) as AverageRuns from MatchPerformance
where Runs>20;

select min(Wickets) as MinimumWickets from MatchPerformance;

select min(Catches) as MinimumCatches,max(Catches) as MaximumCatches,avg(Catches) as AverageCatches from MatchPerformance;

select Role,count(*) as PlayerCount from Player
where Age>25 
group by Role;

select Country,count(*) as PlayerCount from Player
where Role='Bowler' 
group by Country;

select PlayerID,sum(Runs) as TotalRuns from MatchPerformance
where Runs>20 
group by PlayerID;

select MatchID,sum(Wickets) as TotalWickets from MatchPerformance
where Wickets>0 
group by MatchID;

select Country,count(*) as PlayerCount from Player
group by Country 
having count(*)>2;

select PlayerID,sum(Runs) as TotalRuns from MatchPerformance 
group by PlayerID 
having sum(Runs)>100;

select MatchID,sum(Wickets) as TotalWickets from MatchPerformance
group by MatchID 
having sum(Wickets)>3;

select PlayerID,sum(Runs) as TotalRuns from MatchPerformance
group by PlayerID 
having sum(Runs)>100 
order by TotalRuns desc;

select PlayerID,avg(Runs) as AverageRuns from MatchPerformance 
group by PlayerID
having avg(Runs)>30 
order by AverageRuns asc;

update TEAM 
set Ranking=1
where TeamID=101;

update Player 
set Age=Age+1
where Age>30 and Role='Batsman';

update MatchPerformance
set Catches=Catches+1 
where Wickets>2 and Catches<3;

delete from Player
where Age>45 and Country<>'India';

delete from MatchPerformance
where Runs<20 and Wickets=0;

delete from TEAM 
where Ranking>15 and Country='India';

select p.PlayerName,p.Role,mp.Runs from Player p 
join MatchPerformance mp on p.PlayerID=mp.PlayerID;

select t.TeamName,m.MatchDate,m.Venue from TEAM t 
join Match m on t.TeamID=m.Team1ID;

select p.PlayerName,mp.MatchID,mp.Runs,mp.Wickets
from Player p
join MatchPerformance mp on p.PlayerID=mp.PlayerID
where mp.Runs>50;

select p.PlayerName,m.MatchDate,m.Venue,mp.Runs
from Player p
join MatchPerformance mp on p.PlayerID=mp.PlayerID
join Match m on mp.MatchID=m.MatchID;

select p.PlayerName,m.Matchtype,m.Venue,mp.Wickets
from Player p
join MatchPerformance mp on p.PlayerID=mp.PlayerID
join Match m on mp.MatchID=m.MatchID
where mp.Wickets>2;

select p.PlayerName,mp.Runs
from Player p
join MatchPerformance mp on p.PlayerID=mp.PlayerID
where mp.Runs>(select avg(Runs) from MatchPerformance);

select p.PlayerName,sum(mp.Runs) as TotalRuns
from Player p
join MatchPerformance mp on p.PlayerID=mp.PlayerID
group by p.PlayerID,p.PlayerName
having sum(mp.Runs)>(
select sum(Runs)
from MatchPerformance
where PlayerID=1
);