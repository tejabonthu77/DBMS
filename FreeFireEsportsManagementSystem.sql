CREATE DATABASE FreeFireEsportsManagementSystem;
USE FreeFireEsportsManagementSystem;

CREATE TABLE Organizer(
    Organizer_ID INT PRIMARY KEY,
    Organizer_Name VARCHAR(50),
    Organization_Name VARCHAR(100),
    Registration_Number VARCHAR(30) UNIQUE,
    Phone VARCHAR(15),
    Alternate_Phone VARCHAR(15),
    Email VARCHAR(100),
    Website VARCHAR(100),
    Address VARCHAR(150),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    Experience_Years INT,
    Organizer_Type VARCHAR(30),
    Organizer_Status VARCHAR(30)
);

CREATE TABLE Sponsor(
    Sponsor_ID INT PRIMARY KEY,
    Sponsor_Name VARCHAR(50),
    Company_Name VARCHAR(100),
    Contact_Person VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Website VARCHAR(100),
    Address VARCHAR(150),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    Sponsorship_Type VARCHAR(50),
    Sponsorship_Amount DECIMAL(12,2),
    Start_Date DATE,
    Sponsor_Status VARCHAR(30)
);

CREATE TABLE Player(
    Player_ID INT PRIMARY KEY,
    Player_Name VARCHAR(50),
    Game_Name VARCHAR(50),
    UID VARCHAR(30) UNIQUE,
    Age INT,
    Gender VARCHAR(10),
    Date_of_Birth DATE,
    Country VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Joining_Date DATE,
    Player_Status VARCHAR(30),
    Experience_Years INT
);

CREATE TABLE Team(
    Team_ID INT PRIMARY KEY,
    Team_Name VARCHAR(50),
    Team_Code VARCHAR(30) UNIQUE,
    Country VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50),
    Captain_ID INT,
    Manager_Name VARCHAR(50),
    Contact_Number VARCHAR(15),
    Email VARCHAR(100),
    Registration_Date DATE,
    Total_Players INT,
    Team_Rank INT,
    Team_Status VARCHAR(30),
    Description VARCHAR(150),
    FOREIGN KEY(Captain_ID) REFERENCES Player(Player_ID)
);

CREATE TABLE Role(
    Role_ID INT PRIMARY KEY,
    Role_Name VARCHAR(30) UNIQUE,
    Role_Code VARCHAR(20),
    Role_Description VARCHAR(150),
    Main_Task VARCHAR(150),
    Attack_Level INT,
    Defense_Level INT,
    Support_Level INT,
    Long_Range_Level INT,
    Close_Range_Level INT,
    Required_Per_Team INT,
    Minimum_Kills INT,
    Special_Ability VARCHAR(100),
    Training_Level VARCHAR(30),
    Role_Status VARCHAR(20)
);

CREATE TABLE Tournament(
    Tournament_ID INT PRIMARY KEY,
    Tournament_Name VARCHAR(100),
    Tournament_Code VARCHAR(30) UNIQUE,
    Tournament_Type VARCHAR(30),
    Tournament_Date DATE,
    Start_Time TIME,
    End_Time TIME,
    Location VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50),
    Prize_Pool DECIMAL(10,2),
    Max_Teams INT,
    Total_Matches INT,
    Tournament_Status VARCHAR(30),
    Description VARCHAR(200),
    Organizer_ID INT,
    Sponsor_ID INT,
    FOREIGN KEY(Organizer_ID) REFERENCES Organizer(Organizer_ID),
    FOREIGN KEY(Sponsor_ID) REFERENCES Sponsor(Sponsor_ID)
);

CREATE TABLE TeamMember(
    TeamMember_ID INT PRIMARY KEY,
    Team_ID INT,
    Player_ID INT,
    Role_ID INT,
    Jersey_Number INT,
    Join_Date DATE,
    Leave_Date DATE,
    Is_Captain VARCHAR(10),
    Is_Substitute VARCHAR(10),
    Member_Status VARCHAR(30),
    Matches_Played INT,
    Matches_Won INT,
    Total_Kills INT,
    Total_Revives INT,
    Performance_Rating DECIMAL(5,2),
    FOREIGN KEY(Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY(Player_ID) REFERENCES Player(Player_ID),
    FOREIGN KEY(Role_ID) REFERENCES Role(Role_ID)
);

CREATE TABLE Registration(
    Registration_ID INT PRIMARY KEY,
    Tournament_ID INT,
    Team_ID INT,
    Registration_Number VARCHAR(50),
    Registration_Date DATE,
    Registration_Time TIME,
    Captain_ID INT,
    Total_Players INT,
    Substitute_Count INT,
    Registration_Fee DECIMAL(10,2),
    Payment_Status VARCHAR(30),
    Payment_Mode VARCHAR(30),
    Verification_Status VARCHAR(30),
    Registration_Status VARCHAR(30),
    Remarks VARCHAR(150),
    FOREIGN KEY(Tournament_ID) REFERENCES Tournament(Tournament_ID),
    FOREIGN KEY(Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY(Captain_ID) REFERENCES Player(Player_ID)
);

CREATE TABLE Map(
    Map_ID INT PRIMARY KEY,
    Map_Name VARCHAR(50),
    Map_Code VARCHAR(20) UNIQUE,
    Map_Type VARCHAR(30),
    Map_Size VARCHAR(30),
    Release_Year INT,
    Environment VARCHAR(50),
    Weather VARCHAR(50),
    Terrain_Type VARCHAR(50),
    Main_Locations VARCHAR(150),
    Hot_Drop_Area VARCHAR(100),
    Safe_Zone_Type VARCHAR(50),
    Vehicle_Available VARCHAR(10),
    Difficulty_Level VARCHAR(30),
    Map_Status VARCHAR(30)
);

CREATE TABLE Referee(
    Referee_ID INT PRIMARY KEY,
    Referee_Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Country VARCHAR(50),
    State VARCHAR(50),
    Experience_Years INT,
    Matches_Handled INT,
    Tournaments_Handled INT,
    Certification VARCHAR(100),
    Specialization VARCHAR(100),
    Rating DECIMAL(3,2),
    Referee_Status VARCHAR(30)
);

CREATE TABLE MatchInfo(
    Match_ID INT PRIMARY KEY,
    Tournament_ID INT,
    Match_Number INT,
    Match_Name VARCHAR(100),
    Map_ID INT,
    Match_Date DATE,
    Start_Time TIME,
    End_Time TIME,
    Total_Players INT,
    Total_Teams INT,
    Active_Players INT,
    Winning_Team_ID INT,
    Booyah_Team_ID INT,
    Match_Status VARCHAR(30),
    Total_Kills INT,
    FOREIGN KEY(Tournament_ID) REFERENCES Tournament(Tournament_ID),
    FOREIGN KEY(Map_ID) REFERENCES Map(Map_ID),
    FOREIGN KEY(Winning_Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY(Booyah_Team_ID) REFERENCES Team(Team_ID)
);

CREATE TABLE MatchTeam(
    MatchTeam_ID INT PRIMARY KEY,
    Match_ID INT,
    Team_ID INT,
    Team_Position INT,
    Total_Kills INT,
    Total_Deaths INT,
    Total_Revives INT,
    Total_Assists INT,
    Total_Damage INT,
    Alive_Last_Zone VARCHAR(10),
    Booyah VARCHAR(10),
    Placement_Points INT,
    Kill_Points INT,
    Total_Points INT,
    Prize_Amount DECIMAL(10,2),
    FOREIGN KEY(Match_ID) REFERENCES MatchInfo(Match_ID),
    FOREIGN KEY(Team_ID) REFERENCES Team(Team_ID)
);

CREATE TABLE PlayerMatch(
    PlayerMatch_ID INT PRIMARY KEY,
    Match_ID INT,
    Player_ID INT,
    Team_ID INT,
    Role_ID INT,
    Kills INT,
    Deaths INT,
    Revives INT,
    Assists INT,
    Damage INT,
    Headshots INT,
    Survival_Time INT,
    Alive_Last_Zone VARCHAR(10),
    Booyah VARCHAR(10),
    Performance_Rating DECIMAL(5,2),
    FOREIGN KEY(Match_ID) REFERENCES MatchInfo(Match_ID),
    FOREIGN KEY(Player_ID) REFERENCES Player(Player_ID),
    FOREIGN KEY(Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY(Role_ID) REFERENCES Role(Role_ID)
);

CREATE TABLE TeamMatch(
    TeamMatch_ID INT PRIMARY KEY,
    Match_ID INT,
    Team_ID INT,
    Total_Kills INT,
    Total_Deaths INT,
    Total_Revives INT,
    Total_Assists INT,
    Total_Damage INT,
    Alive_Last_Zone_Count INT,
    Booyah VARCHAR(10),
    Position INT,
    Placement_Points INT,
    Kill_Points INT,
    Total_Points INT,
    Prize_Amount DECIMAL(10,2),
    FOREIGN KEY(Match_ID) REFERENCES MatchInfo(Match_ID),
    FOREIGN KEY(Team_ID) REFERENCES Team(Team_ID)
);

CREATE TABLE KillRecord(
    Kill_ID INT PRIMARY KEY,
    Match_ID INT,
    Killer_ID INT,
    Victim_ID INT,
    Killer_Team_ID INT,
    Victim_Team_ID INT,
    Killer_Role_ID INT,
    Weapon_Name VARCHAR(50),
    Weapon_Type VARCHAR(30),
    Kill_Type VARCHAR(30),
    Headshot VARCHAR(10),
    Distance DECIMAL(8,2),
    Kill_Time TIME,
    Location VARCHAR(100),
    Damage_Dealt INT,
    FOREIGN KEY(Match_ID) REFERENCES MatchInfo(Match_ID),
    FOREIGN KEY(Killer_ID) REFERENCES Player(Player_ID),
    FOREIGN KEY(Victim_ID) REFERENCES Player(Player_ID),
    FOREIGN KEY(Killer_Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY(Victim_Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY(Killer_Role_ID) REFERENCES Role(Role_ID)
);

CREATE TABLE ReviveRecord(
    Revive_ID INT PRIMARY KEY,
    Match_ID INT,
    Reviver_ID INT,
    Revived_Player_ID INT,
    Team_ID INT,
    Reviver_Role_ID INT,
    Revive_Time TIME,
    Revive_Duration INT,
    Zone_Number INT,
    Location VARCHAR(100),
    Health_Before INT,
    Health_After INT,
    Revive_Success VARCHAR(10),
    Enemy_Nearby VARCHAR(10),
    Cover_Provided VARCHAR(10),
    FOREIGN KEY(Match_ID) REFERENCES MatchInfo(Match_ID),
    FOREIGN KEY(Reviver_ID) REFERENCES Player(Player_ID),
    FOREIGN KEY(Revived_Player_ID) REFERENCES Player(Player_ID),
    FOREIGN KEY(Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY(Reviver_Role_ID) REFERENCES Role(Role_ID)
);

CREATE TABLE ZoneStatus(
    Zone_ID INT PRIMARY KEY,
    Match_ID INT,
    Zone_Number INT,
    Zone_Status VARCHAR(30),
    Start_Time TIME,
    End_Time TIME,
    Duration INT,
    Radius DECIMAL(10,2),
    Center_X DECIMAL(10,2),
    Center_Y DECIMAL(10,2),
    Damage_Per_Second DECIMAL(8,2),
    Players_Alive INT,
    Players_Eliminated INT,
    Teams_Alive INT,
    Teams_Eliminated INT,
    FOREIGN KEY(Match_ID) REFERENCES MatchInfo(Match_ID)
);

CREATE TABLE Ranking(
    Ranking_ID INT PRIMARY KEY,
    Tournament_ID INT,
    Match_ID INT,
    Team_ID INT,
    Position INT,
    Total_Kills INT,
    Placement_Points INT,
    Kill_Points INT,
    Total_Points INT,
    Booyah VARCHAR(10),
    Matches_Played INT,
    Matches_Won INT,
    Average_Kills DECIMAL(5,2),
    Prize_Amount DECIMAL(10,2),
    Ranking_Status VARCHAR(30),
    FOREIGN KEY(Tournament_ID) REFERENCES Tournament(Tournament_ID),
    FOREIGN KEY(Match_ID) REFERENCES MatchInfo(Match_ID),
    FOREIGN KEY(Team_ID) REFERENCES Team(Team_ID)
);

CREATE TABLE Prize(
    Prize_ID INT PRIMARY KEY,
    Prize_Name VARCHAR(100),
    Position INT,
    Prize_Amount DECIMAL(10,2),
    Bonus_Amount DECIMAL(10,2),
    Currency VARCHAR(10),
    Prize_Type VARCHAR(30),
    Tournament_ID INT,
    Match_ID INT,
    Team_ID INT,
    Player_ID INT,
    Award_Date DATE,
    Payment_Status VARCHAR(30),
    Payment_Mode VARCHAR(30),
    Transaction_ID VARCHAR(50),
    FOREIGN KEY(Tournament_ID) REFERENCES Tournament(Tournament_ID),
    FOREIGN KEY(Match_ID) REFERENCES MatchInfo(Match_ID),
    FOREIGN KEY(Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY(Player_ID) REFERENCES Player(Player_ID)
);

CREATE TABLE PlayerStatistics(
    Statistics_ID INT PRIMARY KEY,
    Player_ID INT,
    Tournament_ID INT,
    Match_ID INT,
    Matches_Played INT,
    Total_Kills INT,
    Total_Deaths INT,
    Total_Revives INT,
    Total_Assists INT,
    Total_Damage INT,
    Headshots INT,
    Average_Kills DECIMAL(5,2),
    Average_Damage DECIMAL(10,2),
    Booyah_Count INT,
    Performance_Rating DECIMAL(5,2),
    FOREIGN KEY(Player_ID) REFERENCES Player(Player_ID),
    FOREIGN KEY(Tournament_ID) REFERENCES Tournament(Tournament_ID),
    FOREIGN KEY(Match_ID) REFERENCES MatchInfo(Match_ID)
);

CREATE TABLE Leaderboard(
    Leaderboard_ID INT PRIMARY KEY,
    Tournament_ID INT,
    Player_ID INT,
    Team_ID INT,
    Role_ID INT,
    Player_Name VARCHAR(50),
    Team_Name VARCHAR(50),
    Matches_Played INT,
    Total_Kills INT,
    Total_Deaths INT,
    Total_Revives INT,
    Total_Damage INT,
    Booyah_Count INT,
    Total_Points INT,
    Rank_Position INT,
    FOREIGN KEY(Tournament_ID) REFERENCES Tournament(Tournament_ID),
    FOREIGN KEY(Player_ID) REFERENCES Player(Player_ID),
    FOREIGN KEY(Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY(Role_ID) REFERENCES Role(Role_ID)
);

INSERT INTO Organizer VALUES
(1,'Arjun Rao','Battle Arena','ORG001','9876543210','9123456780','arjun@arena.com','www.arena.com','MG Road','Bengaluru','Karnataka','India',8,'Private','Active'),
(2,'Kiran Kumar','Esports India','ORG002','9876501234','9123405678','kiran@esports.com','www.esportsindia.com','Banjara Hills','Hyderabad','Telangana','India',6,'Private','Active'),
(3,'Rahul Das','Gaming League','ORG003','9867543210','9134567890','rahul@gaming.com','www.gamingleague.com','Salt Lake','Kolkata','West Bengal','India',5,'Private','Active'),
(4,'Vikram Singh','Pro Arena','ORG004','9856743210','9145678901','vikram@proarena.com','www.proarena.com','Andheri','Mumbai','Maharashtra','India',7,'Private','Active'),
(5,'Sanjay Nair','Kerala Esports','ORG005','9847012345','9156789012','sanjay@keralaesports.com','www.keralaesports.com','MG Road','Kochi','Kerala','India',4,'Private','Active');

INSERT INTO Sponsor VALUES
(1,'RedFire','RedFire Gaming','Amit Shah','9871001111','amit@redfire.com','www.redfire.com','MG Road','Bengaluru','Karnataka','India','Gaming',150000,'2026-01-01','Active'),
(2,'GameZone','GameZone India','Ravi Kumar','9871002222','ravi@gamezone.com','www.gamezone.com','Hitech City','Hyderabad','Telangana','India','Technology',120000,'2026-02-01','Active'),
(3,'Volt','Volt Energy','Nikhil Rao','9871003333','nikhil@volt.com','www.volt.com','Marine Drive','Mumbai','Maharashtra','India','Beverage',100000,'2026-03-01','Active'),
(4,'TechPro','TechPro Systems','Manoj Das','9871004444','manoj@techpro.com','www.techpro.com','Salt Lake','Kolkata','West Bengal','India','Technology',90000,'2026-04-01','Active'),
(5,'PowerX','PowerX Gaming','Rohit Menon','9871005555','rohit@powerx.com','www.powerx.com','MG Road','Kochi','Kerala','India','Gaming',80000,'2026-05-01','Active');

INSERT INTO Player VALUES
(1,'Aarav','AaravX','FF10001',21,'Male','2005-01-12','India','Telangana','Hyderabad','9000000001','aarav@gmail.com','2025-01-10','Active',3),
(2,'Arjun','ArjunOP','FF10002',22,'Male','2004-03-15','India','Karnataka','Bengaluru','9000000002','arjun@gmail.com','2025-01-11','Active',4),
(3,'Rohit','RohitPro','FF10003',20,'Male','2006-05-20','India','Tamil Nadu','Chennai','9000000003','rohit@gmail.com','2025-01-12','Active',2),
(4,'Kiran','KiranFF','FF10004',21,'Male','2005-07-18','India','Kerala','Kochi','9000000004','kiran@gmail.com','2025-01-13','Active',3),
(5,'Vijay','VijayX','FF10005',23,'Male','2003-02-10','India','Andhra Pradesh','Vijayawada','9000000005','vijay@gmail.com','2025-01-14','Active',5),
(6,'Rahul','RahulOP','FF10006',22,'Male','2004-04-11','India','Telangana','Warangal','9000000006','rahul@gmail.com','2025-01-15','Active',4),
(7,'Surya','SuryaFF','FF10007',20,'Male','2006-06-12','India','Tamil Nadu','Madurai','9000000007','surya@gmail.com','2025-01-16','Active',2),
(8,'Aditya','AdiPro','FF10008',21,'Male','2005-08-14','India','Karnataka','Mysuru','9000000008','aditya@gmail.com','2025-01-17','Active',3),
(9,'Varun','VarunX','FF10009',22,'Male','2004-09-16','India','Kerala','Thrissur','9000000009','varun@gmail.com','2025-01-18','Active',4),
(10,'Nikhil','NikOP','FF10010',23,'Male','2003-10-20','India','Maharashtra','Pune','9000000010','nikhil@gmail.com','2025-01-19','Active',5),
(11,'Akash','AkashFF','FF10011',21,'Male','2005-11-22','India','Karnataka','Bengaluru','9000000011','akash@gmail.com','2025-01-20','Active',3),
(12,'Manoj','ManojPro','FF10012',22,'Male','2004-12-25','India','Andhra Pradesh','Tirupati','9000000012','manoj@gmail.com','2025-01-21','Active',4),
(13,'Sai','SaiX','FF10013',20,'Male','2006-01-10','India','Telangana','Nizamabad','9000000013','sai@gmail.com','2025-01-22','Active',2),
(14,'Karthik','KarthikOP','FF10014',21,'Male','2005-02-14','India','Tamil Nadu','Coimbatore','9000000014','karthik@gmail.com','2025-01-23','Active',3),
(15,'Pranav','PranavFF','FF10015',22,'Male','2004-03-18','India','Kerala','Kozhikode','9000000015','pranav@gmail.com','2025-01-24','Active',4),
(16,'Harsha','HarshaPro','FF10016',23,'Male','2003-04-20','India','Andhra Pradesh','Guntur','9000000016','harsha@gmail.com','2025-01-25','Active',5),
(17,'Rakesh','RakeshX','FF10017',21,'Male','2005-05-22','India','Telangana','Karimnagar','9000000017','rakesh@gmail.com','2025-01-26','Active',3),
(18,'Tejas','TejasOP','FF10018',20,'Male','2006-06-25','India','Karnataka','Hubli','9000000018','tejas@gmail.com','2025-01-27','Active',2),
(19,'Sandeep','SandyFF','FF10019',22,'Male','2004-07-28','India','Kerala','Kannur','9000000019','sandeep@gmail.com','2025-01-28','Active',4),
(20,'Mohan','MohanPro','FF10020',23,'Male','2003-08-30','India','Tamil Nadu','Salem','9000000020','mohan@gmail.com','2025-01-29','Active',5),
(21,'Dev','DevX','FF10021',21,'Male','2005-09-12','India','Maharashtra','Mumbai','9000000021','dev@gmail.com','2025-01-30','Active',3),
(22,'Naveen','NaveenOP','FF10022',22,'Male','2004-10-15','India','Andhra Pradesh','Nellore','9000000022','naveen@gmail.com','2025-02-01','Active',4),
(23,'Tarun','TarunFF','FF10023',20,'Male','2006-11-18','India','Telangana','Hyderabad','9000000023','tarun@gmail.com','2025-02-02','Active',2),
(24,'Yash','YashPro','FF10024',21,'Male','2005-12-20','India','Karnataka','Mangaluru','9000000024','yash@gmail.com','2025-02-03','Active',3),
(25,'Abhishek','AbhiX','FF10025',22,'Male','2004-01-22','India','Kerala','Kochi','9000000025','abhishek@gmail.com','2025-02-04','Active',4),
(26,'Ravi','RaviOP','FF10026',23,'Male','2003-02-25','India','Tamil Nadu','Chennai','9000000026','ravi@gmail.com','2025-02-05','Active',5),
(27,'Vishal','VishalFF','FF10027',21,'Male','2005-03-28','India','Maharashtra','Nagpur','9000000027','vishal@gmail.com','2025-02-06','Active',3),
(28,'Gautham','GauthamPro','FF10028',20,'Male','2006-04-30','India','Andhra Pradesh','Kurnool','9000000028','gautham@gmail.com','2025-02-07','Active',2),
(29,'Raman','RamanX','FF10029',22,'Male','2004-05-12','India','Telangana','Khammam','9000000029','raman@gmail.com','2025-02-08','Active',4),
(30,'Ajay','AjayOP','FF10030',23,'Male','2003-06-15','India','Karnataka','Belagavi','9000000030','ajay@gmail.com','2025-02-09','Active',5),
(31,'Sanjay','SanjayFF','FF10031',21,'Male','2005-07-18','India','Kerala','Kollam','9000000031','sanjay@gmail.com','2025-02-10','Active',3),
(32,'Dinesh','DineshPro','FF10032',22,'Male','2004-08-20','India','Tamil Nadu','Trichy','9000000032','dinesh@gmail.com','2025-02-11','Active',4),
(33,'Mithun','MithunX','FF10033',20,'Male','2006-09-22','India','Andhra Pradesh','Visakhapatnam','9000000033','mithun@gmail.com','2025-02-12','Active',2),
(34,'Rohan','RohanOP','FF10034',21,'Male','2005-10-25','India','Maharashtra','Nashik','9000000034','rohan@gmail.com','2025-02-13','Active',3),
(35,'Ishan','IshanFF','FF10035',22,'Male','2004-11-28','India','Karnataka','Dharwad','9000000035','ishan@gmail.com','2025-02-14','Active',4),
(36,'Abhinav','AbhiPro','FF10036',23,'Male','2003-12-30','India','Telangana','Secunderabad','9000000036','abhinav@gmail.com','2025-02-15','Active',5),
(37,'Rajat','RajatX','FF10037',21,'Male','2005-01-12','India','Kerala','Alappuzha','9000000037','rajat@gmail.com','2025-02-16','Active',3),
(38,'Nithin','NithinOP','FF10038',20,'Male','2006-02-15','India','Tamil Nadu','Erode','9000000038','nithin@gmail.com','2025-02-17','Active',2),
(39,'Sahil','SahilFF','FF10039',22,'Male','2004-03-18','India','Maharashtra','Thane','9000000039','sahil@gmail.com','2025-02-18','Active',4),
(40,'Akhil','AkhilPro','FF10040',23,'Male','2003-04-20','India','Andhra Pradesh','Kadapa','9000000040','akhil@gmail.com','2025-02-19','Active',5),
(41,'Deepak','DeepakX','FF10041',21,'Male','2005-05-22','India','Telangana','Adilabad','9000000041','deepak@gmail.com','2025-02-20','Active',3),
(42,'Lokesh','LokeshOP','FF10042',22,'Male','2004-06-25','India','Karnataka','Ballari','9000000042','lokesh@gmail.com','2025-02-21','Active',4),
(43,'Prakash','PrakashFF','FF10043',20,'Male','2006-07-28','India','Kerala','Palakkad','9000000043','prakash@gmail.com','2025-02-22','Active',2),
(44,'Vamshi','VamshiPro','FF10044',21,'Male','2005-08-30','India','Telangana','Warangal','9000000044','vamshi@gmail.com','2025-02-23','Active',3),
(45,'Naveen','NaveenX','FF10045',22,'Male','2004-09-12','India','Tamil Nadu','Tirunelveli','9000000045','naveenx@gmail.com','2025-02-24','Active',4),
(46,'Suresh','SureshOP','FF10046',23,'Male','2003-10-15','India','Andhra Pradesh','Rajahmundry','9000000046','suresh@gmail.com','2025-02-25','Active',5),
(47,'Manish','ManishFF','FF10047',21,'Male','2005-11-18','India','Maharashtra','Aurangabad','9000000047','manish@gmail.com','2025-02-26','Active',3),
(48,'Varsha','VarshaPro','FF10048',20,'Female','2006-12-20','India','Karnataka','Bengaluru','9000000048','varsha@gmail.com','2025-02-27','Active',2),
(49,'Neha','NehaX','FF10049',21,'Female','2005-01-22','India','Kerala','Kochi','9000000049','neha@gmail.com','2025-02-28','Active',3),
(50,'Ananya','AnanyaOP','FF10050',22,'Female','2004-02-25','India','Telangana','Hyderabad','9000000050','ananya@gmail.com','2025-03-01','Active',4);

INSERT INTO Team VALUES
(1,'Shadow Kings','SK001','India','Telangana','Hyderabad',1,'Ramesh','9010000001','shadow@gmail.com','2026-01-01',4,1,'Active','Professional Team'),
(2,'Fire Wolves','FW002','India','Karnataka','Bengaluru',5,'Suresh','9010000002','firewolves@gmail.com','2026-01-02',4,2,'Active','Professional Team'),
(3,'Dark Eagles','DE003','India','Kerala','Kochi',9,'Manoj','9010000003','darkeagles@gmail.com','2026-01-03',4,3,'Active','Professional Team'),
(4,'Thunder Boys','TB004','India','Tamil Nadu','Chennai',13,'Ravi','9010000004','thunder@gmail.com','2026-01-04',4,4,'Active','Professional Team'),
(5,'Night Hunters','NH005','India','Andhra Pradesh','Vijayawada',17,'Kumar','9010000005','night@gmail.com','2026-01-05',4,5,'Active','Professional Team'),
(6,'Storm Riders','SR006','India','Telangana','Warangal',21,'Arun','9010000006','storm@gmail.com','2026-01-06',4,6,'Active','Professional Team'),
(7,'Dragon Force','DF007','India','Karnataka','Mysuru',25,'Naveen','9010000007','dragon@gmail.com','2026-01-07',4,7,'Active','Professional Team'),
(8,'Alpha Squad','AS008','India','Maharashtra','Mumbai',29,'Vijay','9010000008','alpha@gmail.com','2026-01-08',4,8,'Active','Professional Team'),
(9,'Ghost Army','GA009','India','Kerala','Kozhikode',33,'Ajith','9010000009','ghost@gmail.com','2026-01-09',4,9,'Active','Professional Team'),
(10,'War Machines','WM010','India','Tamil Nadu','Coimbatore',37,'Karthik','9010000010','war@gmail.com','2026-01-10',4,10,'Active','Professional Team'),
(11,'Royal Squad','RS011','India','Andhra Pradesh','Tirupati',41,'Raju','9010000011','royal@gmail.com','2026-01-11',4,11,'Active','Professional Team'),
(12,'Phoenix X','PX012','India','Telangana','Hyderabad',45,'Mohan','9010000012','phoenix@gmail.com','2026-01-12',4,12,'Active','Professional Team');

INSERT INTO Role VALUES
(1,'Rusher','RSH','Aggressive attacker','Attack enemies and secure kills',10,6,4,5,10,1,2,'Fast attack','Advanced','Active'),
(2,'Team Support','SUP','Support specialist','Provide cover and assist teammates',5,8,10,6,5,1,1,'Team support','Advanced','Active'),
(3,'Sniper','SNP','Long range specialist','Eliminate enemies from distance',8,5,4,10,3,1,2,'Long range attack','Advanced','Active'),
(4,'Reviver','REV','Revival specialist','Revive and protect teammates',4,9,10,5,4,1,1,'Fast revival','Advanced','Active');

INSERT INTO Map VALUES
(1,'Bermuda','MAP001','Battle Royale','Large',2017,'Tropical','Clear','Mixed','Peak,Clock Tower,Factory','Peak','Circular','Yes','Medium','Active'),
(2,'Purgatory','MAP002','Battle Royale','Large',2018,'Mountain','Clear','Mountain','Central,Forge,Moathouse','Central','Circular','Yes','Hard','Active'),
(3,'Kalahari','MAP003','Battle Royale','Medium',2020,'Desert','Sunny','Desert','Command Post,Refinery','Command Post','Circular','Yes','Hard','Active'),
(4,'Alpine','MAP004','Battle Royale','Large',2021,'Snow','Cold','Snow','Snowfall,Dobro','Snowfall','Circular','Yes','Medium','Active'),
(5,'NexTerra','MAP005','Battle Royale','Large',2022,'Urban','Clear','Urban','Twin Bridge,Deca Square','Deca Square','Circular','Yes','Hard','Active'),
(6,'Solara','MAP006','Battle Royale','Medium',2024,'Island','Sunny','Island','Aquarium,Factory','Aquarium','Circular','Yes','Medium','Active'),
(7,'Bermuda Remastered','MAP007','Battle Royale','Large',2020,'Tropical','Clear','Mixed','Peak,Bimasakti','Peak','Circular','Yes','Medium','Active'),
(8,'Kalahari Night','MAP008','Battle Royale','Medium',2023,'Desert','Night','Desert','Refinery,Sanctuary','Refinery','Circular','Yes','Hard','Active'),
(9,'Alpine Storm','MAP009','Battle Royale','Large',2024,'Snow','Storm','Snow','Militia,Stadium','Stadium','Circular','Yes','Hard','Active'),
(10,'NexTerra City','MAP010','Battle Royale','Large',2025,'Urban','Clear','Urban','Deca Square,Twin Bridge','Deca Square','Circular','Yes','Medium','Active');

INSERT INTO Referee VALUES
(1,'Ramesh Kumar',35,'Male','9020000001','ramesh@referee.com','India','Telangana',8,120,15,'ESI Level 2','Battle Royale',4.80,'Active'),
(2,'Suresh Rao',32,'Male','9020000002','suresh@referee.com','India','Karnataka',7,100,12,'ESI Level 2','Battle Royale',4.70,'Active'),
(3,'Anil Das',38,'Male','9020000003','anil@referee.com','India','Kerala',10,150,20,'ESI Level 3','Esports',4.90,'Active'),
(4,'Mohan Singh',34,'Male','9020000004','mohan@referee.com','India','Maharashtra',6,90,10,'ESI Level 2','Battle Royale',4.60,'Active'),
(5,'Kiran Nair',31,'Male','9020000005','kiran@referee.com','India','Kerala',5,80,9,'ESI Level 1','Esports',4.50,'Active');

INSERT INTO Tournament VALUES
(1,'Free Fire Champions Cup','FFC001','Championship','2026-09-28','10:00:00','18:00:00','Arena Ground','Hyderabad','India',10000,12,10,'Completed','National Championship',1,1),
(2,'Battle Masters','BM002','League','2026-10-05','11:00:00','19:00:00','Esports Arena','Bengaluru','India',10000,12,10,'Upcoming','League Tournament',2,2),
(3,'Fire Clash','FC003','Championship','2026-10-12','12:00:00','20:00:00','Gaming Hall','Kochi','India',10000,12,10,'Upcoming','Championship Event',3,3),
(4,'Pro Warriors','PW004','League','2026-10-20','13:00:00','21:00:00','Pro Arena','Chennai','India',10000,12,10,'Upcoming','Professional League',4,4),
(5,'Elite Fire Cup','EFC005','Championship','2026-10-28','14:00:00','22:00:00','Elite Hall','Vijayawada','India',10000,12,10,'Upcoming','Elite Tournament',5,5),
(6,'Indian Fire League','IFL006','League','2026-11-05','15:00:00','23:00:00','Gaming Stadium','Mumbai','India',10000,12,10,'Upcoming','National League',1,1),
(7,'Battle Royale Cup','BRC007','Championship','2026-11-12','16:00:00','23:30:00','Arena Center','Hyderabad','India',10000,12,10,'Upcoming','Battle Championship',2,2),
(8,'Fire Masters','FM008','League','2026-11-20','17:00:00','23:30:00','Gaming Arena','Kolkata','India',10000,12,10,'Upcoming','Masters League',3,3),
(9,'Ultimate Clash','UC009','Championship','2026-11-28','18:00:00','23:30:00','Pro Ground','Pune','India',10000,12,10,'Upcoming','Ultimate Championship',4,4),
(10,'Grand Fire Finals','GFF010','Final','2026-12-05','10:00:00','20:00:00','National Arena','Delhi','India',10000,12,10,'Upcoming','Grand Final',5,5);

INSERT INTO TeamMember VALUES
(1,1,1,1,1,'2026-01-01',NULL,'Yes','No','Active',10,6,52,18,9.20),
(2,1,2,2,2,'2026-01-01',NULL,'No','No','Active',10,6,20,35,8.70),
(3,1,3,3,3,'2026-01-01',NULL,'No','No','Active',10,6,40,12,9.00),
(4,1,4,4,4,'2026-01-01',NULL,'No','No','Active',10,6,15,42,8.80),
(5,2,5,1,1,'2026-01-02',NULL,'Yes','No','Active',10,5,48,16,8.90),
(6,2,6,2,2,'2026-01-02',NULL,'No','No','Active',10,5,18,32,8.40),
(7,2,7,3,3,'2026-01-02',NULL,'No','No','Active',10,5,37,11,8.70),
(8,2,8,4,4,'2026-01-02',NULL,'No','No','Active',10,5,14,39,8.50),
(9,3,9,1,1,'2026-01-03',NULL,'Yes','No','Active',10,5,45,15,8.60),
(10,3,10,2,2,'2026-01-03',NULL,'No','No','Active',10,5,17,30,8.20),
(11,3,11,3,3,'2026-01-03',NULL,'No','No','Active',10,5,35,10,8.50),
(12,3,12,4,4,'2026-01-03',NULL,'No','No','Active',10,5,13,37,8.30),
(13,4,13,1,1,'2026-01-04',NULL,'Yes','No','Active',10,4,42,14,8.40),
(14,4,14,2,2,'2026-01-04',NULL,'No','No','Active',10,4,16,28,8.00),
(15,4,15,3,3,'2026-01-04',NULL,'No','No','Active',10,4,33,9,8.30),
(16,4,16,4,4,'2026-01-04',NULL,'No','No','Active',10,4,12,35,8.10),
(17,5,17,1,1,'2026-01-05',NULL,'Yes','No','Active',10,4,40,13,8.20),
(18,5,18,2,2,'2026-01-05',NULL,'No','No','Active',10,4,15,27,7.90),
(19,5,19,3,3,'2026-01-05',NULL,'No','No','Active',10,4,31,8,8.10),
(20,5,20,4,4,'2026-01-05',NULL,'No','No','Active',10,4,11,33,7.90),
(21,6,21,1,1,'2026-01-06',NULL,'Yes','No','Active',10,3,38,12,8.00),
(22,6,22,2,2,'2026-01-06',NULL,'No','No','Active',10,3,14,25,7.70),
(23,6,23,3,3,'2026-01-06',NULL,'No','No','Active',10,3,29,8,7.90),
(24,6,24,4,4,'2026-01-06',NULL,'No','No','Active',10,3,10,31,7.70),
(25,7,25,1,1,'2026-01-07',NULL,'Yes','No','Active',10,3,36,11,7.80),
(26,7,26,2,2,'2026-01-07',NULL,'No','No','Active',10,3,13,24,7.50),
(27,7,27,3,3,'2026-01-07',NULL,'No','No','Active',10,3,28,7,7.70),
(28,7,28,4,4,'2026-01-07',NULL,'No','No','Active',10,3,9,29,7.50),
(29,8,29,1,1,'2026-01-08',NULL,'Yes','No','Active',10,2,34,10,7.60),
(30,8,30,2,2,'2026-01-08',NULL,'No','No','Active',10,2,12,22,7.30),
(31,8,31,3,3,'2026-01-08',NULL,'No','No','Active',10,2,27,7,7.50),
(32,8,32,4,4,'2026-01-08',NULL,'No','No','Active',10,2,8,27,7.30),
(33,9,33,1,1,'2026-01-09',NULL,'Yes','No','Active',10,2,32,9,7.40),
(34,9,34,2,2,'2026-01-09',NULL,'No','No','Active',10,2,11,21,7.10),
(35,9,35,3,3,'2026-01-09',NULL,'No','No','Active',10,2,25,6,7.30),
(36,9,36,4,4,'2026-01-09',NULL,'No','No','Active',10,2,8,25,7.10),
(37,10,37,1,1,'2026-01-10',NULL,'Yes','No','Active',10,2,30,8,7.20),
(38,10,38,2,2,'2026-01-10',NULL,'No','No','Active',10,2,10,20,6.90),
(39,10,39,3,3,'2026-01-10',NULL,'No','No','Active',10,2,23,6,7.10),
(40,10,40,4,4,'2026-01-10',NULL,'No','No','Active',10,2,7,23,6.90),
(41,11,41,1,1,'2026-01-11',NULL,'Yes','No','Active',10,1,28,7,7.00),
(42,11,42,2,2,'2026-01-11',NULL,'No','No','Active',10,1,9,18,6.80),
(43,11,43,3,3,'2026-01-11',NULL,'No','No','Active',10,1,21,5,6.90),
(44,11,44,4,4,'2026-01-11',NULL,'No','No','Active',10,1,6,21,6.70),
(45,12,45,1,1,'2026-01-12',NULL,'Yes','No','Active',10,1,26,6,6.80),
(46,12,46,2,2,'2026-01-12',NULL,'No','No','Active',10,1,8,17,6.60),
(47,12,47,3,3,'2026-01-12',NULL,'No','No','Active',10,1,20,5,6.70),
(48,12,48,4,4,'2026-01-12',NULL,'No','No','Active',10,1,6,19,6.50),
(49,1,49,4,5,'2026-02-01',NULL,'No','Yes','Substitute',5,2,7,10,6.50),
(50,2,50,4,5,'2026-02-01',NULL,'No','Yes','Substitute',5,2,8,11,6.60);

INSERT INTO Registration VALUES
(1,1,1,'REG001','2026-09-01','10:00:00',1,4,1,500,'Paid','UPI','Verified','Approved','Confirmed'),
(2,1,2,'REG002','2026-09-01','10:15:00',5,4,1,500,'Paid','UPI','Verified','Approved','Confirmed'),
(3,1,3,'REG003','2026-09-01','10:30:00',9,4,0,500,'Paid','Card','Verified','Approved','Confirmed'),
(4,1,4,'REG004','2026-09-01','10:45:00',13,4,0,500,'Paid','UPI','Verified','Approved','Confirmed'),
(5,1,5,'REG005','2026-09-01','11:00:00',17,4,0,500,'Paid','UPI','Verified','Approved','Confirmed'),
(6,1,6,'REG006','2026-09-01','11:15:00',21,4,0,500,'Paid','Card','Verified','Approved','Confirmed'),
(7,1,7,'REG007','2026-09-01','11:30:00',25,4,0,500,'Paid','UPI','Verified','Approved','Confirmed'),
(8,1,8,'REG008','2026-09-01','11:45:00',29,4,0,500,'Paid','UPI','Verified','Approved','Confirmed'),
(9,1,9,'REG009','2026-09-01','12:00:00',33,4,0,500,'Paid','Card','Verified','Approved','Confirmed'),
(10,1,10,'REG010','2026-09-01','12:15:00',37,4,0,500,'Paid','UPI','Verified','Approved','Confirmed'),
(11,1,11,'REG011','2026-09-01','12:30:00',41,4,0,500,'Paid','UPI','Verified','Approved','Confirmed'),
(12,1,12,'REG012','2026-09-01','12:45:00',45,4,0,500,'Paid','Card','Verified','Approved','Confirmed');

INSERT INTO MatchInfo VALUES
(1,1,1,'Champions Match 1',1,'2026-09-28','10:00:00','10:35:00',50,12,4,1,1,'Completed',156),
(2,1,2,'Champions Match 2',2,'2026-09-28','11:00:00','11:38:00',50,12,5,2,2,'Completed',149),
(3,1,3,'Champions Match 3',3,'2026-09-28','12:00:00','12:40:00',50,12,6,3,3,'Completed',162),
(4,1,4,'Champions Match 4',4,'2026-09-28','13:00:00','13:42:00',50,12,4,4,4,'Completed',151),
(5,1,5,'Champions Match 5',5,'2026-09-28','14:00:00','14:45:00',50,12,5,5,5,'Completed',158),
(6,1,6,'Champions Match 6',6,'2026-09-28','15:00:00','15:40:00',50,12,4,6,6,'Completed',145),
(7,1,7,'Champions Match 7',7,'2026-09-28','16:00:00','16:42:00',50,12,5,7,7,'Completed',153),
(8,1,8,'Champions Match 8',8,'2026-09-28','17:00:00','17:43:00',50,12,4,8,8,'Completed',147),
(9,1,9,'Champions Match 9',9,'2026-09-28','18:00:00','18:45:00',50,12,6,9,9,'Completed',159),
(10,1,10,'Champions Match 10',10,'2026-09-28','19:00:00','19:48:00',50,12,5,10,10,'Completed',161);

INSERT INTO MatchTeam VALUES
(1,1,1,1,14,3,6,8,2100,'Yes','Yes',12,14,26,5000),
(2,1,2,2,13,4,5,7,2000,'Yes','No',9,13,22,0),
(3,1,3,3,12,4,6,6,1900,'Yes','No',8,12,20,0),
(4,1,4,4,11,5,5,7,1800,'Yes','No',7,11,18,0),
(5,1,5,5,10,5,4,6,1700,'No','No',6,10,16,0),
(6,1,6,6,9,6,5,5,1600,'No','No',5,9,14,0),
(7,1,7,7,8,6,4,5,1500,'No','No',4,8,12,0),
(8,1,8,8,8,7,4,4,1450,'No','No',3,8,11,0),
(9,1,9,9,7,7,3,4,1350,'No','No',2,7,9,0),
(10,1,10,10,7,8,3,3,1300,'No','No',1,7,8,0),
(11,1,11,11,6,8,3,3,1250,'No','No',1,6,7,0),
(12,1,12,12,6,9,2,3,1200,'No','No',1,6,7,0);

INSERT INTO TeamMatch VALUES
(1,1,1,14,3,6,8,2100,4,'Yes',1,12,14,26,5000),
(2,1,2,13,4,5,7,2000,4,'No',2,9,13,22,0),
(3,1,3,12,4,6,6,1900,4,'No',3,8,12,20,0),
(4,1,4,11,5,5,7,1800,4,'No',4,7,11,18,0),
(5,1,5,10,5,4,6,1700,0,'No',5,6,10,16,0),
(6,1,6,9,6,5,5,1600,0,'No',6,5,9,14,0),
(7,1,7,8,6,4,5,1500,0,'No',7,4,8,12,0),
(8,1,8,8,7,4,4,1450,0,'No',8,3,8,11,0),
(9,1,9,7,7,3,4,1350,0,'No',9,2,7,9,0),
(10,1,10,7,8,3,3,1300,0,'No',10,1,7,8,0),
(11,1,11,6,8,3,3,1250,0,'No',11,1,6,7,0),
(12,1,12,6,9,2,3,1200,0,'No',12,1,6,7,0);

INSERT INTO PlayerMatch VALUES
(1,1,1,1,1,6,1,1,2,520,3,2100,'Yes','Yes',9.80),
(2,1,2,1,2,2,1,3,4,380,1,2050,'Yes','Yes',8.90),
(3,1,3,1,3,5,1,0,2,610,4,2080,'Yes','Yes',9.40),
(4,1,4,1,4,1,0,4,5,300,0,2040,'Yes','Yes',8.80),
(5,1,5,2,1,5,1,1,2,490,2,1980,'Yes','No',9.10),
(6,1,6,2,2,2,1,2,3,350,1,1960,'Yes','No',8.50),
(7,1,7,2,3,4,1,1,2,550,3,1940,'Yes','No',9.00),
(8,1,8,2,4,2,1,3,3,320,1,1900,'Yes','No',8.40),
(9,1,9,3,1,4,1,1,2,470,2,1870,'Yes','No',8.80),
(10,1,10,3,2,2,1,2,3,340,1,1850,'Yes','No',8.20),
(11,1,11,3,3,4,1,0,2,500,3,1830,'Yes','No',8.70),
(12,1,12,3,4,2,1,3,3,310,1,1810,'Yes','No',8.10),
(13,1,13,4,1,5,1,1,2,460,2,1780,'Yes','No',8.60),
(14,1,14,4,2,2,1,2,3,330,1,1760,'Yes','No',8.00),
(15,1,15,4,3,3,1,0,2,480,2,1740,'Yes','No',8.40),
(16,1,16,4,4,1,1,3,3,290,1,1720,'Yes','No',7.90);

INSERT INTO KillRecord VALUES
(1,1,1,6,1,2,1,'MP40','SMG','Normal','No',18.5,'10:08:10','Peak',180),
(2,1,1,7,1,2,1,'M1887','Shotgun','Headshot','Yes',9.2,'10:10:20','Peak',220),
(3,1,3,8,1,2,3,'AWM','Sniper','Headshot','Yes',95.4,'10:12:15','Clock Tower',250),
(4,1,5,10,2,3,1,'SCAR','AR','Normal','No',42.3,'10:14:30','Factory',190),
(5,1,7,11,2,3,3,'Woodpecker','Marksman','Headshot','Yes',67.8,'10:16:40','Central',240),
(6,1,9,14,3,4,1,'XM8','AR','Normal','No',35.2,'10:18:10','Peak',175),
(7,1,11,16,3,4,3,'AWM','Sniper','Headshot','Yes',101.5,'10:20:25','Clock Tower',260),
(8,1,13,18,4,5,1,'MP40','SMG','Normal','No',22.4,'10:22:35','Factory',185),
(9,1,15,20,4,5,3,'M82B','Sniper','Headshot','Yes',88.2,'10:24:40','Peak',245),
(10,1,2,21,1,6,2,'M4A1','AR','Normal','No',45.6,'10:26:20','Bimasakti',190);

INSERT INTO ReviveRecord VALUES
(1,1,4,1,1,4,'10:09:30',8,2,'Peak',0,100,'Yes','No','Yes'),
(2,1,8,5,2,4,'10:15:20',7,3,'Factory',0,100,'Yes','Yes','Yes'),
(3,1,12,9,3,4,'10:19:10',9,3,'Central',0,100,'Yes','No','Yes'),
(4,1,16,13,4,4,'10:23:15',8,4,'Clock Tower',0,100,'Yes','No','Yes'),
(5,1,4,3,1,4,'10:27:10',6,5,'Peak',0,100,'Yes','No','Yes');

INSERT INTO ZoneStatus VALUES
(1,1,1,'Active','10:02:00','10:08:00',360,500,100.5,200.5,1.0,50,0,12,0),
(2,1,2,'Closed','10:08:00','10:14:00',360,400,110.5,210.5,1.5,42,8,12,0),
(3,1,3,'Closed','10:14:00','10:20:00',360,300,120.5,220.5,2.0,35,7,10,2),
(4,1,4,'Closed','10:20:00','10:27:00',420,220,130.5,230.5,2.5,24,11,8,2),
(5,1,5,'Final','10:27:00','10:35:00',480,120,140.5,240.5,3.0,8,16,3,5);

INSERT INTO Ranking VALUES
(1,1,1,1,1,14,12,14,26,'Yes',1,1,14.00,5000,'Final'),
(2,1,1,2,2,13,9,13,22,'No',1,0,13.00,0,'Final'),
(3,1,1,3,3,12,8,12,20,'No',1,0,12.00,0,'Final'),
(4,1,1,4,4,11,7,11,18,'No',1,0,11.00,0,'Final'),
(5,1,1,5,5,10,6,10,16,'No',1,0,10.00,0,'Final'),
(6,1,1,6,6,9,5,9,14,'No',1,0,9.00,0,'Final'),
(7,1,1,7,7,8,4,8,12,'No',1,0,8.00,0,'Final'),
(8,1,1,8,8,8,3,8,11,'No',1,0,8.00,0,'Final'),
(9,1,1,9,9,7,2,7,9,'No',1,0,7.00,0,'Final'),
(10,1,1,10,10,7,1,7,8,'No',1,0,7.00,0,'Final'),
(11,1,1,11,11,6,1,6,7,'No',1,0,6.00,0,'Final'),
(12,1,1,12,12,6,1,6,7,'No',1,0,6.00,0,'Final');

INSERT INTO Prize VALUES
(1,'Championship Prize',1,5000,0,'INR','Team',1,1,1,NULL,'2026-09-28','Paid','UPI','TXN001'),
(2,'Championship Prize',2,3000,0,'INR','Team',1,1,2,NULL,'2026-09-28','Paid','UPI','TXN002'),
(3,'Championship Prize',3,2000,0,'INR','Team',1,1,3,NULL,'2026-09-28','Paid','UPI','TXN003'),
(4,'MVP Award',1,1000,0,'INR','Player',1,1,1,1,'2026-09-28','Paid','UPI','TXN004'),
(5,'Best Rusher',1,500,0,'INR','Player',1,1,1,1,'2026-09-28','Paid','UPI','TXN005'),
(6,'Best Sniper',1,500,0,'INR','Player',1,1,1,3,'2026-09-28','Paid','UPI','TXN006');

INSERT INTO PlayerStatistics VALUES
(1,1,1,1,10,52,12,18,25,5200,24,5.20,520.00,3,9.20),
(2,2,1,1,10,20,15,35,40,3800,10,2.00,380.00,3,8.70),
(3,3,1,1,10,40,10,12,18,6100,28,4.00,610.00,3,9.00),
(4,4,1,1,10,15,14,42,45,3000,7,1.50,300.00,3,8.80),
(5,5,1,1,10,48,14,16,22,4900,20,4.80,490.00,2,8.90),
(6,6,1,1,10,18,17,32,38,3500,9,1.80,350.00,2,8.40),
(7,7,1,1,10,37,12,11,19,5500,25,3.70,550.00,2,8.70),
(8,8,1,1,10,14,18,39,42,3200,8,1.40,320.00,2,8.50),
(9,9,1,1,10,45,13,15,20,4700,19,4.50,470.00,2,8.60),
(10,10,1,1,10,17,18,30,36,3400,8,1.70,340.00,2,8.20);

INSERT INTO Leaderboard VALUES
(1,1,1,1,1,'Aarav','Shadow Kings',10,52,12,18,5200,3,126,1),
(2,1,3,1,3,'Rohit','Shadow Kings',10,40,10,12,6100,3,118,2),
(3,1,5,2,1,'Vijay','Fire Wolves',10,48,14,16,4900,2,112,3),
(4,1,7,2,3,'Surya','Fire Wolves',10,37,12,11,5500,2,105,4),
(5,1,9,3,1,'Varun','Dark Eagles',10,45,13,15,4700,2,102,5),
(6,1,11,3,3,'Akash','Dark Eagles',10,35,11,10,5000,2,98,6),
(7,1,13,4,1,'Sai','Thunder Boys',10,42,15,14,4600,2,95,7),
(8,1,17,5,1,'Rakesh','Night Hunters',10,40,16,13,4400,2,91,8),
(9,1,21,6,1,'Dev','Storm Riders',10,38,17,12,4300,1,88,9),
(10,1,25,7,1,'Abhishek','Dragon Force',10,36,18,11,4200,1,84,10),
(11,1,29,8,1,'Raman','Alpha Squad',10,34,19,10,4100,1,80,11),
(12,1,33,9,1,'Mithun','Ghost Army',10,32,20,9,4000,1,76,12);

select * from Organizer; 
select * from Sponsor;
select * from Player;
select * from Team;
select * from Role;
select * from Map;
select * from Referee;
select * from Tournament
select * from TeamMember;
select * from Registration;
select * from MatchInfo;
select * from MatchTeam;
select * from TeamMatch;
select * from PlayerMatch;
select * from KillRecord;
select * from ReviveRecord;
select * from ZoneStatus;
select * from Ranking;
select * from Prize;
select * from PlayerStatistics;
select * from Leaderboard;


-- Query 1
SELECT Organizer_ID FROM Organizer;
-- Output:
-- Organizer_ID
-- 1
-- 2
-- 3
-- 4
-- 5

-- Query 2
SELECT Organizer_Name FROM Organizer;
-- Output:
-- Organizer_Name
-- Arjun Rao
-- Kiran Kumar
-- Rahul Das
-- Vikram Singh
-- Sanjay Nair

-- Query 3
SELECT Organizer_ID, Organizer_Name FROM Organizer;
-- Output:
-- Organizer_ID | Organizer_Name
-- 1 | Arjun Rao
-- 2 | Kiran Kumar
-- 3 | Rahul Das
-- 4 | Vikram Singh
-- 5 | Sanjay Nair

-- Query 4
SELECT DISTINCT Organizer_Name FROM Organizer;
-- Output:
-- Organizer_Name
-- Arjun Rao
-- Kiran Kumar
-- Rahul Das
-- Vikram Singh
-- Sanjay Nair

-- Query 5
SELECT Organizer_ID FROM Organizer ORDER BY Organizer_ID;
-- Output:
-- Organizer_ID
-- 1
-- 2
-- 3
-- 4
-- 5

-- Query 6
SELECT Organizer_ID FROM Organizer ORDER BY Organizer_ID DESC;
-- Output:
-- Organizer_ID
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 7
SELECT Organizer_ID FROM Organizer WHERE Organizer_ID = 1;
-- Output:
-- Organizer_ID
-- 1

-- Query 8
SELECT Organizer_Name FROM Organizer WHERE Organizer_Name = 'Arjun Rao';
-- Output:
-- Organizer_Name
-- Arjun Rao

-- Query 9
SELECT Organization_Name FROM Organizer WHERE Organization_Name = 'Battle Arena';
-- Output:
-- Organization_Name
-- Battle Arena

-- Query 10
SELECT DISTINCT Organization_Name FROM Organizer ORDER BY Organization_Name;
-- Output:
-- Organization_Name
-- Battle Arena
-- Esports India
-- Gaming League
-- Kerala Esports
-- Pro Arena

-- Query 11
SELECT COUNT(*) AS Total_Rows FROM Organizer;
-- Output:
-- Total_Rows
-- 5

-- Query 12
SELECT Organizer_Name FROM Organizer ORDER BY Organizer_Name;
-- Output:
-- Organizer_Name
-- Arjun Rao
-- Kiran Kumar
-- Rahul Das
-- Sanjay Nair
-- Vikram Singh

-- Query 13
SELECT Organizer_Name FROM Organizer ORDER BY Organizer_Name DESC;
-- Output:
-- Organizer_Name
-- Vikram Singh
-- Sanjay Nair
-- Rahul Das
-- Kiran Kumar
-- Arjun Rao

-- Query 14
SELECT Organizer_ID, Organization_Name FROM Organizer ORDER BY Organization_Name;
-- Output:
-- Organizer_ID | Organization_Name
-- 1 | Battle Arena
-- 2 | Esports India
-- 3 | Gaming League
-- 5 | Kerala Esports
-- 4 | Pro Arena

-- Query 15
SELECT Organization_Name, COUNT(*) AS Total FROM Organizer GROUP BY Organization_Name;
-- Output:
-- Organization_Name | Total
-- Battle Arena | 1
-- Esports India | 1
-- Gaming League | 1
-- Kerala Esports | 1
-- Pro Arena | 1

-- Query 16
SELECT Organizer_ID, Organizer_Name, Organization_Name FROM Organizer;
-- Output:
-- Organizer_ID | Organizer_Name | Organization_Name
-- 1 | Arjun Rao | Battle Arena
-- 2 | Kiran Kumar | Esports India
-- 3 | Rahul Das | Gaming League
-- 4 | Vikram Singh | Pro Arena
-- 5 | Sanjay Nair | Kerala Esports

-- Query 17
SELECT DISTINCT Organizer_ID, Organizer_Name FROM Organizer;
-- Output:
-- Organizer_ID | Organizer_Name
-- 1 | Arjun Rao
-- 2 | Kiran Kumar
-- 3 | Rahul Das
-- 4 | Vikram Singh
-- 5 | Sanjay Nair

-- Query 18
SELECT Organization_Name FROM Organizer WHERE Organization_Name IS NOT NULL;
-- Output:
-- Organization_Name
-- Battle Arena
-- Esports India
-- Gaming League
-- Pro Arena
-- Kerala Esports

-- Query 19
SELECT Sponsor_ID FROM Sponsor;
-- Output:
-- Sponsor_ID
-- 1
-- 2
-- 3
-- 4
-- 5

-- Query 20
SELECT Sponsor_Name FROM Sponsor;
-- Output:
-- Sponsor_Name
-- RedFire
-- GameZone
-- Volt
-- TechPro
-- PowerX

-- Query 21
SELECT Sponsor_ID, Sponsor_Name FROM Sponsor;
-- Output:
-- Sponsor_ID | Sponsor_Name
-- 1 | RedFire
-- 2 | GameZone
-- 3 | Volt
-- 4 | TechPro
-- 5 | PowerX

-- Query 22
SELECT DISTINCT Sponsor_Name FROM Sponsor;
-- Output:
-- Sponsor_Name
-- RedFire
-- GameZone
-- Volt
-- TechPro
-- PowerX

-- Query 23
SELECT Sponsor_ID FROM Sponsor ORDER BY Sponsor_ID;
-- Output:
-- Sponsor_ID
-- 1
-- 2
-- 3
-- 4
-- 5

-- Query 24
SELECT Sponsor_ID FROM Sponsor ORDER BY Sponsor_ID DESC;
-- Output:
-- Sponsor_ID
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 25
SELECT Sponsor_ID FROM Sponsor WHERE Sponsor_ID = 1;
-- Output:
-- Sponsor_ID
-- 1

-- Query 26
SELECT Sponsor_Name FROM Sponsor WHERE Sponsor_Name = 'GameZone';
-- Output:
-- Sponsor_Name
-- GameZone

-- Query 27
SELECT Company_Name FROM Sponsor WHERE Company_Name = 'GameZone India';
-- Output:
-- Company_Name
-- GameZone India

-- Query 28
SELECT DISTINCT Company_Name FROM Sponsor ORDER BY Company_Name;
-- Output:
-- Company_Name
-- GameZone India
-- PowerX Gaming
-- RedFire Gaming
-- TechPro Systems
-- Volt Energy

-- Query 29
SELECT COUNT(*) AS Total_Rows FROM Sponsor;
-- Output:
-- Total_Rows
-- 5

-- Query 30
SELECT Sponsor_Name FROM Sponsor ORDER BY Sponsor_Name;
-- Output:
-- Sponsor_Name
-- GameZone
-- PowerX
-- RedFire
-- TechPro
-- Volt

-- Query 31
SELECT Sponsor_Name FROM Sponsor ORDER BY Sponsor_Name DESC;
-- Output:
-- Sponsor_Name
-- Volt
-- TechPro
-- RedFire
-- PowerX
-- GameZone

-- Query 32
SELECT Sponsor_ID, Company_Name FROM Sponsor ORDER BY Company_Name;
-- Output:
-- Sponsor_ID | Company_Name
-- 2 | GameZone India
-- 5 | PowerX Gaming
-- 1 | RedFire Gaming
-- 4 | TechPro Systems
-- 3 | Volt Energy

-- Query 33
SELECT Company_Name, COUNT(*) AS Total FROM Sponsor GROUP BY Company_Name;
-- Output:
-- Company_Name | Total
-- GameZone India | 1
-- PowerX Gaming | 1
-- RedFire Gaming | 1
-- TechPro Systems | 1
-- Volt Energy | 1

-- Query 34
SELECT Sponsor_ID, Sponsor_Name, Company_Name FROM Sponsor;
-- Output:
-- Sponsor_ID | Sponsor_Name | Company_Name
-- 1 | RedFire | RedFire Gaming
-- 2 | GameZone | GameZone India
-- 3 | Volt | Volt Energy
-- 4 | TechPro | TechPro Systems
-- 5 | PowerX | PowerX Gaming

-- Query 35
SELECT DISTINCT Sponsor_ID, Sponsor_Name FROM Sponsor;
-- Output:
-- Sponsor_ID | Sponsor_Name
-- 1 | RedFire
-- 2 | GameZone
-- 3 | Volt
-- 4 | TechPro
-- 5 | PowerX

-- Query 36
SELECT Company_Name FROM Sponsor WHERE Company_Name IS NOT NULL;
-- Output:
-- Company_Name
-- RedFire Gaming
-- GameZone India
-- Volt Energy
-- TechPro Systems
-- PowerX Gaming

-- Query 37
SELECT Player_ID FROM Player;
-- Output:
-- Player_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12
-- 13
-- 14
-- 15
-- 16
-- 17
-- 18
-- 19
-- 20
-- 21
-- 22
-- 23
-- 24
-- 25
-- 26
-- 27
-- 28
-- 29
-- 30
-- 31
-- 32
-- 33
-- 34
-- 35
-- 36
-- 37
-- 38
-- 39
-- 40
-- 41
-- 42
-- 43
-- 44
-- 45
-- 46
-- 47
-- 48
-- 49
-- 50

-- Query 38
SELECT Player_Name FROM Player;
-- Output:
-- Player_Name
-- Aarav
-- Arjun
-- Rohit
-- Kiran
-- Vijay
-- Rahul
-- Surya
-- Aditya
-- Varun
-- Nikhil
-- Akash
-- Manoj
-- Sai
-- Karthik
-- Pranav
-- Harsha
-- Rakesh
-- Tejas
-- Sandeep
-- Mohan
-- Dev
-- Naveen
-- Tarun
-- Yash
-- Abhishek
-- Ravi
-- Vishal
-- Gautham
-- Raman
-- Ajay
-- Sanjay
-- Dinesh
-- Mithun
-- Rohan
-- Ishan
-- Abhinav
-- Rajat
-- Nithin
-- Sahil
-- Akhil
-- Deepak
-- Lokesh
-- Prakash
-- Vamshi
-- Naveen
-- Suresh
-- Manish
-- Varsha
-- Neha
-- Ananya

-- Query 39
SELECT Player_ID, Player_Name FROM Player;
-- Output:
-- Player_ID | Player_Name
-- 1 | Aarav
-- 2 | Arjun
-- 3 | Rohit
-- 4 | Kiran
-- 5 | Vijay
-- 6 | Rahul
-- 7 | Surya
-- 8 | Aditya
-- 9 | Varun
-- 10 | Nikhil
-- 11 | Akash
-- 12 | Manoj
-- 13 | Sai
-- 14 | Karthik
-- 15 | Pranav
-- 16 | Harsha
-- 17 | Rakesh
-- 18 | Tejas
-- 19 | Sandeep
-- 20 | Mohan
-- 21 | Dev
-- 22 | Naveen
-- 23 | Tarun
-- 24 | Yash
-- 25 | Abhishek
-- 26 | Ravi
-- 27 | Vishal
-- 28 | Gautham
-- 29 | Raman
-- 30 | Ajay
-- 31 | Sanjay
-- 32 | Dinesh
-- 33 | Mithun
-- 34 | Rohan
-- 35 | Ishan
-- 36 | Abhinav
-- 37 | Rajat
-- 38 | Nithin
-- 39 | Sahil
-- 40 | Akhil
-- 41 | Deepak
-- 42 | Lokesh
-- 43 | Prakash
-- 44 | Vamshi
-- 45 | Naveen
-- 46 | Suresh
-- 47 | Manish
-- 48 | Varsha
-- 49 | Neha
-- 50 | Ananya

-- Query 40
SELECT DISTINCT Player_Name FROM Player;
-- Output:
-- Player_Name
-- Aarav
-- Arjun
-- Rohit
-- Kiran
-- Vijay
-- Rahul
-- Surya
-- Aditya
-- Varun
-- Nikhil
-- Akash
-- Manoj
-- Sai
-- Karthik
-- Pranav
-- Harsha
-- Rakesh
-- Tejas
-- Sandeep
-- Mohan
-- Dev
-- Naveen
-- Tarun
-- Yash
-- Abhishek
-- Ravi
-- Vishal
-- Gautham
-- Raman
-- Ajay
-- Sanjay
-- Dinesh
-- Mithun
-- Rohan
-- Ishan
-- Abhinav
-- Rajat
-- Nithin
-- Sahil
-- Akhil
-- Deepak
-- Lokesh
-- Prakash
-- Vamshi
-- Suresh
-- Manish
-- Varsha
-- Neha
-- Ananya

-- Query 41
SELECT Player_ID FROM Player ORDER BY Player_ID;
-- Output:
-- Player_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12
-- 13
-- 14
-- 15
-- 16
-- 17
-- 18
-- 19
-- 20
-- 21
-- 22
-- 23
-- 24
-- 25
-- 26
-- 27
-- 28
-- 29
-- 30
-- 31
-- 32
-- 33
-- 34
-- 35
-- 36
-- 37
-- 38
-- 39
-- 40
-- 41
-- 42
-- 43
-- 44
-- 45
-- 46
-- 47
-- 48
-- 49
-- 50

-- Query 42
SELECT Player_ID FROM Player ORDER BY Player_ID DESC;
-- Output:
-- Player_ID
-- 50
-- 49
-- 48
-- 47
-- 46
-- 45
-- 44
-- 43
-- 42
-- 41
-- 40
-- 39
-- 38
-- 37
-- 36
-- 35
-- 34
-- 33
-- 32
-- 31
-- 30
-- 29
-- 28
-- 27
-- 26
-- 25
-- 24
-- 23
-- 22
-- 21
-- 20
-- 19
-- 18
-- 17
-- 16
-- 15
-- 14
-- 13
-- 12
-- 11
-- 10
-- 9
-- 8
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 43
SELECT Player_ID FROM Player WHERE Player_ID = 1;
-- Output:
-- Player_ID
-- 1

-- Query 44
SELECT Player_Name FROM Player WHERE Player_Name = 'Aarav';
-- Output:
-- Player_Name
-- Aarav

-- Query 45
SELECT Game_Name FROM Player WHERE Game_Name = 'AaravX';
-- Output:
-- Game_Name
-- AaravX

-- Query 46
SELECT DISTINCT Game_Name FROM Player ORDER BY Game_Name;
-- Output:
-- Game_Name
-- AaravX
-- AbhiPro
-- AbhiX
-- AdiPro
-- AjayOP
-- AkashFF
-- AkhilPro
-- AnanyaOP
-- ArjunOP
-- DeepakX
-- DevX
-- DineshPro
-- GauthamPro
-- HarshaPro
-- IshanFF
-- KarthikOP
-- KiranFF
-- LokeshOP
-- ManishFF
-- ManojPro
-- MithunX
-- MohanPro
-- NaveenOP
-- NaveenX
-- NehaX
-- NikOP
-- NithinOP
-- PrakashFF
-- PranavFF
-- RahulOP
-- RajatX
-- RakeshX
-- RamanX
-- RaviOP
-- RohanOP
-- RohitPro
-- SahilFF
-- SaiX
-- SandyFF
-- SanjayFF
-- SureshOP
-- SuryaFF
-- TarunFF
-- TejasOP
-- VamshiPro
-- VarshaPro
-- VarunX
-- VijayX
-- VishalFF
-- YashPro

-- Query 47
SELECT COUNT(*) AS Total_Rows FROM Player;
-- Output:
-- Total_Rows
-- 50

-- Query 48
SELECT Player_Name FROM Player ORDER BY Player_Name;
-- Output:
-- Player_Name
-- Aarav
-- Abhinav
-- Abhishek
-- Aditya
-- Ajay
-- Akash
-- Akhil
-- Ananya
-- Arjun
-- Deepak
-- Dev
-- Dinesh
-- Gautham
-- Harsha
-- Ishan
-- Karthik
-- Kiran
-- Lokesh
-- Manish
-- Manoj
-- Mithun
-- Mohan
-- Naveen
-- Naveen
-- Neha
-- Nikhil
-- Nithin
-- Prakash
-- Pranav
-- Rahul
-- Rajat
-- Rakesh
-- Raman
-- Ravi
-- Rohan
-- Rohit
-- Sahil
-- Sai
-- Sandeep
-- Sanjay
-- Suresh
-- Surya
-- Tarun
-- Tejas
-- Vamshi
-- Varsha
-- Varun
-- Vijay
-- Vishal
-- Yash

-- Query 49
SELECT Player_Name FROM Player ORDER BY Player_Name DESC;
-- Output:
-- Player_Name
-- Yash
-- Vishal
-- Vijay
-- Varun
-- Varsha
-- Vamshi
-- Tejas
-- Tarun
-- Surya
-- Suresh
-- Sanjay
-- Sandeep
-- Sai
-- Sahil
-- Rohit
-- Rohan
-- Ravi
-- Raman
-- Rakesh
-- Rajat
-- Rahul
-- Pranav
-- Prakash
-- Nithin
-- Nikhil
-- Neha
-- Naveen
-- Naveen
-- Mohan
-- Mithun
-- Manoj
-- Manish
-- Lokesh
-- Kiran
-- Karthik
-- Ishan
-- Harsha
-- Gautham
-- Dinesh
-- Dev
-- Deepak
-- Arjun
-- Ananya
-- Akhil
-- Akash
-- Ajay
-- Aditya
-- Abhishek
-- Abhinav
-- Aarav

-- Query 50
SELECT Player_ID, Game_Name FROM Player ORDER BY Game_Name;
-- Output:
-- Player_ID | Game_Name
-- 1 | AaravX
-- 36 | AbhiPro
-- 25 | AbhiX
-- 8 | AdiPro
-- 30 | AjayOP
-- 11 | AkashFF
-- 40 | AkhilPro
-- 50 | AnanyaOP
-- 2 | ArjunOP
-- 41 | DeepakX
-- 21 | DevX
-- 32 | DineshPro
-- 28 | GauthamPro
-- 16 | HarshaPro
-- 35 | IshanFF
-- 14 | KarthikOP
-- 4 | KiranFF
-- 42 | LokeshOP
-- 47 | ManishFF
-- 12 | ManojPro
-- 33 | MithunX
-- 20 | MohanPro
-- 22 | NaveenOP
-- 45 | NaveenX
-- 49 | NehaX
-- 10 | NikOP
-- 38 | NithinOP
-- 43 | PrakashFF
-- 15 | PranavFF
-- 6 | RahulOP
-- 37 | RajatX
-- 17 | RakeshX
-- 29 | RamanX
-- 26 | RaviOP
-- 34 | RohanOP
-- 3 | RohitPro
-- 39 | SahilFF
-- 13 | SaiX
-- 19 | SandyFF
-- 31 | SanjayFF
-- 46 | SureshOP
-- 7 | SuryaFF
-- 23 | TarunFF
-- 18 | TejasOP
-- 44 | VamshiPro
-- 48 | VarshaPro
-- 9 | VarunX
-- 5 | VijayX
-- 27 | VishalFF
-- 24 | YashPro

-- Query 51
SELECT Game_Name, COUNT(*) AS Total FROM Player GROUP BY Game_Name;
-- Output:
-- Game_Name | Total
-- AaravX | 1
-- AbhiPro | 1
-- AbhiX | 1
-- AdiPro | 1
-- AjayOP | 1
-- AkashFF | 1
-- AkhilPro | 1
-- AnanyaOP | 1
-- ArjunOP | 1
-- DeepakX | 1
-- DevX | 1
-- DineshPro | 1
-- GauthamPro | 1
-- HarshaPro | 1
-- IshanFF | 1
-- KarthikOP | 1
-- KiranFF | 1
-- LokeshOP | 1
-- ManishFF | 1
-- ManojPro | 1
-- MithunX | 1
-- MohanPro | 1
-- NaveenOP | 1
-- NaveenX | 1
-- NehaX | 1
-- NikOP | 1
-- NithinOP | 1
-- PrakashFF | 1
-- PranavFF | 1
-- RahulOP | 1
-- RajatX | 1
-- RakeshX | 1
-- RamanX | 1
-- RaviOP | 1
-- RohanOP | 1
-- RohitPro | 1
-- SahilFF | 1
-- SaiX | 1
-- SandyFF | 1
-- SanjayFF | 1
-- SureshOP | 1
-- SuryaFF | 1
-- TarunFF | 1
-- TejasOP | 1
-- VamshiPro | 1
-- VarshaPro | 1
-- VarunX | 1
-- VijayX | 1
-- VishalFF | 1
-- YashPro | 1

-- Query 52
SELECT Player_ID, Player_Name, Game_Name FROM Player;
-- Output:
-- Player_ID | Player_Name | Game_Name
-- 1 | Aarav | AaravX
-- 2 | Arjun | ArjunOP
-- 3 | Rohit | RohitPro
-- 4 | Kiran | KiranFF
-- 5 | Vijay | VijayX
-- 6 | Rahul | RahulOP
-- 7 | Surya | SuryaFF
-- 8 | Aditya | AdiPro
-- 9 | Varun | VarunX
-- 10 | Nikhil | NikOP
-- 11 | Akash | AkashFF
-- 12 | Manoj | ManojPro
-- 13 | Sai | SaiX
-- 14 | Karthik | KarthikOP
-- 15 | Pranav | PranavFF
-- 16 | Harsha | HarshaPro
-- 17 | Rakesh | RakeshX
-- 18 | Tejas | TejasOP
-- 19 | Sandeep | SandyFF
-- 20 | Mohan | MohanPro
-- 21 | Dev | DevX
-- 22 | Naveen | NaveenOP
-- 23 | Tarun | TarunFF
-- 24 | Yash | YashPro
-- 25 | Abhishek | AbhiX
-- 26 | Ravi | RaviOP
-- 27 | Vishal | VishalFF
-- 28 | Gautham | GauthamPro
-- 29 | Raman | RamanX
-- 30 | Ajay | AjayOP
-- 31 | Sanjay | SanjayFF
-- 32 | Dinesh | DineshPro
-- 33 | Mithun | MithunX
-- 34 | Rohan | RohanOP
-- 35 | Ishan | IshanFF
-- 36 | Abhinav | AbhiPro
-- 37 | Rajat | RajatX
-- 38 | Nithin | NithinOP
-- 39 | Sahil | SahilFF
-- 40 | Akhil | AkhilPro
-- 41 | Deepak | DeepakX
-- 42 | Lokesh | LokeshOP
-- 43 | Prakash | PrakashFF
-- 44 | Vamshi | VamshiPro
-- 45 | Naveen | NaveenX
-- 46 | Suresh | SureshOP
-- 47 | Manish | ManishFF
-- 48 | Varsha | VarshaPro
-- 49 | Neha | NehaX
-- 50 | Ananya | AnanyaOP

-- Query 53
SELECT DISTINCT Player_ID, Player_Name FROM Player;
-- Output:
-- Player_ID | Player_Name
-- 1 | Aarav
-- 2 | Arjun
-- 3 | Rohit
-- 4 | Kiran
-- 5 | Vijay
-- 6 | Rahul
-- 7 | Surya
-- 8 | Aditya
-- 9 | Varun
-- 10 | Nikhil
-- 11 | Akash
-- 12 | Manoj
-- 13 | Sai
-- 14 | Karthik
-- 15 | Pranav
-- 16 | Harsha
-- 17 | Rakesh
-- 18 | Tejas
-- 19 | Sandeep
-- 20 | Mohan
-- 21 | Dev
-- 22 | Naveen
-- 23 | Tarun
-- 24 | Yash
-- 25 | Abhishek
-- 26 | Ravi
-- 27 | Vishal
-- 28 | Gautham
-- 29 | Raman
-- 30 | Ajay
-- 31 | Sanjay
-- 32 | Dinesh
-- 33 | Mithun
-- 34 | Rohan
-- 35 | Ishan
-- 36 | Abhinav
-- 37 | Rajat
-- 38 | Nithin
-- 39 | Sahil
-- 40 | Akhil
-- 41 | Deepak
-- 42 | Lokesh
-- 43 | Prakash
-- 44 | Vamshi
-- 45 | Naveen
-- 46 | Suresh
-- 47 | Manish
-- 48 | Varsha
-- 49 | Neha
-- 50 | Ananya

-- Query 54
SELECT Game_Name FROM Player WHERE Game_Name IS NOT NULL;
-- Output:
-- Game_Name
-- AaravX
-- ArjunOP
-- RohitPro
-- KiranFF
-- VijayX
-- RahulOP
-- SuryaFF
-- AdiPro
-- VarunX
-- NikOP
-- AkashFF
-- ManojPro
-- SaiX
-- KarthikOP
-- PranavFF
-- HarshaPro
-- RakeshX
-- TejasOP
-- SandyFF
-- MohanPro
-- DevX
-- NaveenOP
-- TarunFF
-- YashPro
-- AbhiX
-- RaviOP
-- VishalFF
-- GauthamPro
-- RamanX
-- AjayOP
-- SanjayFF
-- DineshPro
-- MithunX
-- RohanOP
-- IshanFF
-- AbhiPro
-- RajatX
-- NithinOP
-- SahilFF
-- AkhilPro
-- DeepakX
-- LokeshOP
-- PrakashFF
-- VamshiPro
-- NaveenX
-- SureshOP
-- ManishFF
-- VarshaPro
-- NehaX
-- AnanyaOP

-- Query 55
SELECT Team_ID FROM Team;
-- Output:
-- Team_ID
-- 8
-- 3
-- 7
-- 2
-- 9
-- 5
-- 12
-- 11
-- 1
-- 6
-- 4
-- 10

-- Query 56
SELECT Team_Name FROM Team;
-- Output:
-- Team_Name
-- Shadow Kings
-- Fire Wolves
-- Dark Eagles
-- Thunder Boys
-- Night Hunters
-- Storm Riders
-- Dragon Force
-- Alpha Squad
-- Ghost Army
-- War Machines
-- Royal Squad
-- Phoenix X

-- Query 57
SELECT Team_ID, Team_Name FROM Team;
-- Output:
-- Team_ID | Team_Name
-- 1 | Shadow Kings
-- 2 | Fire Wolves
-- 3 | Dark Eagles
-- 4 | Thunder Boys
-- 5 | Night Hunters
-- 6 | Storm Riders
-- 7 | Dragon Force
-- 8 | Alpha Squad
-- 9 | Ghost Army
-- 10 | War Machines
-- 11 | Royal Squad
-- 12 | Phoenix X

-- Query 58
SELECT DISTINCT Team_Name FROM Team;
-- Output:
-- Team_Name
-- Shadow Kings
-- Fire Wolves
-- Dark Eagles
-- Thunder Boys
-- Night Hunters
-- Storm Riders
-- Dragon Force
-- Alpha Squad
-- Ghost Army
-- War Machines
-- Royal Squad
-- Phoenix X

-- Query 59
SELECT Team_ID FROM Team ORDER BY Team_ID;
-- Output:
-- Team_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 60
SELECT Team_ID FROM Team ORDER BY Team_ID DESC;
-- Output:
-- Team_ID
-- 12
-- 11
-- 10
-- 9
-- 8
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 61
SELECT Team_ID FROM Team WHERE Team_ID = 1;
-- Output:
-- Team_ID
-- 1

-- Query 62
SELECT Team_Name FROM Team WHERE Team_Name = 'Alpha Squad';
-- Output:
-- Team_Name
-- Alpha Squad

-- Query 63
SELECT Team_Code FROM Team WHERE Team_Code = 'AS008';
-- Output:
-- Team_Code
-- AS008

-- Query 64
SELECT DISTINCT Team_Code FROM Team ORDER BY Team_Code;
-- Output:
-- Team_Code
-- AS008
-- DE003
-- DF007
-- FW002
-- GA009
-- NH005
-- PX012
-- RS011
-- SK001
-- SR006
-- TB004
-- WM010

-- Query 65
SELECT COUNT(*) AS Total_Rows FROM Team;
-- Output:
-- Total_Rows
-- 12

-- Query 66
SELECT Team_Name FROM Team ORDER BY Team_Name;
-- Output:
-- Team_Name
-- Alpha Squad
-- Dark Eagles
-- Dragon Force
-- Fire Wolves
-- Ghost Army
-- Night Hunters
-- Phoenix X
-- Royal Squad
-- Shadow Kings
-- Storm Riders
-- Thunder Boys
-- War Machines

-- Query 67
SELECT Team_Name FROM Team ORDER BY Team_Name DESC;
-- Output:
-- Team_Name
-- War Machines
-- Thunder Boys
-- Storm Riders
-- Shadow Kings
-- Royal Squad
-- Phoenix X
-- Night Hunters
-- Ghost Army
-- Fire Wolves
-- Dragon Force
-- Dark Eagles
-- Alpha Squad

-- Query 68
SELECT Team_ID, Team_Code FROM Team ORDER BY Team_Code;
-- Output:
-- Team_ID | Team_Code
-- 8 | AS008
-- 3 | DE003
-- 7 | DF007
-- 2 | FW002
-- 9 | GA009
-- 5 | NH005
-- 12 | PX012
-- 11 | RS011
-- 1 | SK001
-- 6 | SR006
-- 4 | TB004
-- 10 | WM010

-- Query 69
SELECT Team_Code, COUNT(*) AS Total FROM Team GROUP BY Team_Code;
-- Output:
-- Team_Code | Total
-- AS008 | 1
-- DE003 | 1
-- DF007 | 1
-- FW002 | 1
-- GA009 | 1
-- NH005 | 1
-- PX012 | 1
-- RS011 | 1
-- SK001 | 1
-- SR006 | 1
-- TB004 | 1
-- WM010 | 1

-- Query 70
SELECT Team_ID, Team_Name, Team_Code FROM Team;
-- Output:
-- Team_ID | Team_Name | Team_Code
-- 1 | Shadow Kings | SK001
-- 2 | Fire Wolves | FW002
-- 3 | Dark Eagles | DE003
-- 4 | Thunder Boys | TB004
-- 5 | Night Hunters | NH005
-- 6 | Storm Riders | SR006
-- 7 | Dragon Force | DF007
-- 8 | Alpha Squad | AS008
-- 9 | Ghost Army | GA009
-- 10 | War Machines | WM010
-- 11 | Royal Squad | RS011
-- 12 | Phoenix X | PX012

-- Query 71
SELECT DISTINCT Team_ID, Team_Name FROM Team;
-- Output:
-- Team_ID | Team_Name
-- 1 | Shadow Kings
-- 2 | Fire Wolves
-- 3 | Dark Eagles
-- 4 | Thunder Boys
-- 5 | Night Hunters
-- 6 | Storm Riders
-- 7 | Dragon Force
-- 8 | Alpha Squad
-- 9 | Ghost Army
-- 10 | War Machines
-- 11 | Royal Squad
-- 12 | Phoenix X

-- Query 72
SELECT Team_Code FROM Team WHERE Team_Code IS NOT NULL;
-- Output:
-- Team_Code
-- AS008
-- DE003
-- DF007
-- FW002
-- GA009
-- NH005
-- PX012
-- RS011
-- SK001
-- SR006
-- TB004
-- WM010

-- Query 73
SELECT Role_ID FROM Role;
-- Output:
-- Role_ID
-- 4
-- 1
-- 3
-- 2

-- Query 74
SELECT Role_Name FROM Role;
-- Output:
-- Role_Name
-- Reviver
-- Rusher
-- Sniper
-- Team Support

-- Query 75
SELECT Role_ID, Role_Name FROM Role;
-- Output:
-- Role_ID | Role_Name
-- 4 | Reviver
-- 1 | Rusher
-- 3 | Sniper
-- 2 | Team Support

-- Query 76
SELECT DISTINCT Role_Name FROM Role;
-- Output:
-- Role_Name
-- Reviver
-- Rusher
-- Sniper
-- Team Support

-- Query 77
SELECT Role_ID FROM Role ORDER BY Role_ID;
-- Output:
-- Role_ID
-- 1
-- 2
-- 3
-- 4

-- Query 78
SELECT Role_ID FROM Role ORDER BY Role_ID DESC;
-- Output:
-- Role_ID
-- 4
-- 3
-- 2
-- 1

-- Query 79
SELECT Role_ID FROM Role WHERE Role_ID = 1;
-- Output:
-- Role_ID
-- 1

-- Query 80
SELECT Role_Name FROM Role WHERE Role_Name = 'Reviver';
-- Output:
-- Role_Name
-- Reviver

-- Query 81
SELECT Role_Code FROM Role WHERE Role_Code = 'REV';
-- Output:
-- Role_Code
-- REV

-- Query 82
SELECT DISTINCT Role_Code FROM Role ORDER BY Role_Code;
-- Output:
-- Role_Code
-- REV
-- RSH
-- SNP
-- SUP

-- Query 83
SELECT COUNT(*) AS Total_Rows FROM Role;
-- Output:
-- Total_Rows
-- 4

-- Query 84
SELECT Role_Name FROM Role ORDER BY Role_Name;
-- Output:
-- Role_Name
-- Reviver
-- Rusher
-- Sniper
-- Team Support

-- Query 85
SELECT Role_Name FROM Role ORDER BY Role_Name DESC;
-- Output:
-- Role_Name
-- Team Support
-- Sniper
-- Rusher
-- Reviver

-- Query 86
SELECT Role_ID, Role_Code FROM Role ORDER BY Role_Code;
-- Output:
-- Role_ID | Role_Code
-- 4 | REV
-- 1 | RSH
-- 3 | SNP
-- 2 | SUP

-- Query 87
SELECT Role_Code, COUNT(*) AS Total FROM Role GROUP BY Role_Code;
-- Output:
-- Role_Code | Total
-- REV | 1
-- RSH | 1
-- SNP | 1
-- SUP | 1

-- Query 88
SELECT Role_ID, Role_Name, Role_Code FROM Role;
-- Output:
-- Role_ID | Role_Name | Role_Code
-- 1 | Rusher | RSH
-- 2 | Team Support | SUP
-- 3 | Sniper | SNP
-- 4 | Reviver | REV

-- Query 89
SELECT DISTINCT Role_ID, Role_Name FROM Role;
-- Output:
-- Role_ID | Role_Name
-- 4 | Reviver
-- 1 | Rusher
-- 3 | Sniper
-- 2 | Team Support

-- Query 90
SELECT Role_Code FROM Role WHERE Role_Code IS NOT NULL;
-- Output:
-- Role_Code
-- RSH
-- SUP
-- SNP
-- REV

-- Query 91
SELECT Tournament_ID FROM Tournament;
-- Output:
-- Tournament_ID
-- 2
-- 7
-- 5
-- 3
-- 1
-- 8
-- 10
-- 6
-- 4
-- 9

-- Query 92
SELECT Tournament_Name FROM Tournament;
-- Output:
-- Tournament_Name
-- Free Fire Champions Cup
-- Battle Masters
-- Fire Clash
-- Pro Warriors
-- Elite Fire Cup
-- Indian Fire League
-- Battle Royale Cup
-- Fire Masters
-- Ultimate Clash
-- Grand Fire Finals

-- Query 93
SELECT Tournament_ID, Tournament_Name FROM Tournament;
-- Output:
-- Tournament_ID | Tournament_Name
-- 1 | Free Fire Champions Cup
-- 2 | Battle Masters
-- 3 | Fire Clash
-- 4 | Pro Warriors
-- 5 | Elite Fire Cup
-- 6 | Indian Fire League
-- 7 | Battle Royale Cup
-- 8 | Fire Masters
-- 9 | Ultimate Clash
-- 10 | Grand Fire Finals

-- Query 94
SELECT DISTINCT Tournament_Name FROM Tournament;
-- Output:
-- Tournament_Name
-- Free Fire Champions Cup
-- Battle Masters
-- Fire Clash
-- Pro Warriors
-- Elite Fire Cup
-- Indian Fire League
-- Battle Royale Cup
-- Fire Masters
-- Ultimate Clash
-- Grand Fire Finals

-- Query 95
SELECT Tournament_ID FROM Tournament ORDER BY Tournament_ID;
-- Output:
-- Tournament_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10

-- Query 96
SELECT Tournament_ID FROM Tournament ORDER BY Tournament_ID DESC;
-- Output:
-- Tournament_ID
-- 10
-- 9
-- 8
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 97
SELECT Tournament_ID FROM Tournament WHERE Tournament_ID = 1;
-- Output:
-- Tournament_ID
-- 1

-- Query 98
SELECT Tournament_Name FROM Tournament WHERE Tournament_Name = 'Battle Masters';
-- Output:
-- Tournament_Name
-- Battle Masters

-- Query 99
SELECT Tournament_Code FROM Tournament WHERE Tournament_Code = 'BM002';
-- Output:
-- Tournament_Code
-- BM002

-- Query 100
SELECT DISTINCT Tournament_Code FROM Tournament ORDER BY Tournament_Code;
-- Output:
-- Tournament_Code
-- BM002
-- BRC007
-- EFC005
-- FC003
-- FFC001
-- FM008
-- GFF010
-- IFL006
-- PW004
-- UC009

-- Query 101
SELECT COUNT(*) AS Total_Rows FROM Tournament;
-- Output:
-- Total_Rows
-- 10

-- Query 102
SELECT Tournament_Name FROM Tournament ORDER BY Tournament_Name;
-- Output:
-- Tournament_Name
-- Battle Masters
-- Battle Royale Cup
-- Elite Fire Cup
-- Fire Clash
-- Fire Masters
-- Free Fire Champions Cup
-- Grand Fire Finals
-- Indian Fire League
-- Pro Warriors
-- Ultimate Clash

-- Query 103
SELECT Tournament_Name FROM Tournament ORDER BY Tournament_Name DESC;
-- Output:
-- Tournament_Name
-- Ultimate Clash
-- Pro Warriors
-- Indian Fire League
-- Grand Fire Finals
-- Free Fire Champions Cup
-- Fire Masters
-- Fire Clash
-- Elite Fire Cup
-- Battle Royale Cup
-- Battle Masters

-- Query 104
SELECT Tournament_ID, Tournament_Code FROM Tournament ORDER BY Tournament_Code;
-- Output:
-- Tournament_ID | Tournament_Code
-- 2 | BM002
-- 7 | BRC007
-- 5 | EFC005
-- 3 | FC003
-- 1 | FFC001
-- 8 | FM008
-- 10 | GFF010
-- 6 | IFL006
-- 4 | PW004
-- 9 | UC009

-- Query 105
SELECT Tournament_Code, COUNT(*) AS Total FROM Tournament GROUP BY Tournament_Code;
-- Output:
-- Tournament_Code | Total
-- BM002 | 1
-- BRC007 | 1
-- EFC005 | 1
-- FC003 | 1
-- FFC001 | 1
-- FM008 | 1
-- GFF010 | 1
-- IFL006 | 1
-- PW004 | 1
-- UC009 | 1

-- Query 106
SELECT Tournament_ID, Tournament_Name, Tournament_Code FROM Tournament;
-- Output:
-- Tournament_ID | Tournament_Name | Tournament_Code
-- 1 | Free Fire Champions Cup | FFC001
-- 2 | Battle Masters | BM002
-- 3 | Fire Clash | FC003
-- 4 | Pro Warriors | PW004
-- 5 | Elite Fire Cup | EFC005
-- 6 | Indian Fire League | IFL006
-- 7 | Battle Royale Cup | BRC007
-- 8 | Fire Masters | FM008
-- 9 | Ultimate Clash | UC009
-- 10 | Grand Fire Finals | GFF010

-- Query 107
SELECT DISTINCT Tournament_ID, Tournament_Name FROM Tournament;
-- Output:
-- Tournament_ID | Tournament_Name
-- 1 | Free Fire Champions Cup
-- 2 | Battle Masters
-- 3 | Fire Clash
-- 4 | Pro Warriors
-- 5 | Elite Fire Cup
-- 6 | Indian Fire League
-- 7 | Battle Royale Cup
-- 8 | Fire Masters
-- 9 | Ultimate Clash
-- 10 | Grand Fire Finals

-- Query 108
SELECT Tournament_Code FROM Tournament WHERE Tournament_Code IS NOT NULL;
-- Output:
-- Tournament_Code
-- BM002
-- BRC007
-- EFC005
-- FC003
-- FFC001
-- FM008
-- GFF010
-- IFL006
-- PW004
-- UC009

-- Query 109
SELECT TeamMember_ID FROM TeamMember;
-- Output:
-- TeamMember_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12
-- 13
-- 14
-- 15
-- 16
-- 17
-- 18
-- 19
-- 20
-- 21
-- 22
-- 23
-- 24
-- 25
-- 26
-- 27
-- 28
-- 29
-- 30
-- 31
-- 32
-- 33
-- 34
-- 35
-- 36
-- 37
-- 38
-- 39
-- 40
-- 41
-- 42
-- 43
-- 44
-- 45
-- 46
-- 47
-- 48
-- 49
-- 50

-- Query 110
SELECT Team_ID FROM TeamMember;
-- Output:
-- Team_ID
-- 1
-- 1
-- 1
-- 1
-- 2
-- 2
-- 2
-- 2
-- 3
-- 3
-- 3
-- 3
-- 4
-- 4
-- 4
-- 4
-- 5
-- 5
-- 5
-- 5
-- 6
-- 6
-- 6
-- 6
-- 7
-- 7
-- 7
-- 7
-- 8
-- 8
-- 8
-- 8
-- 9
-- 9
-- 9
-- 9
-- 10
-- 10
-- 10
-- 10
-- 11
-- 11
-- 11
-- 11
-- 12
-- 12
-- 12
-- 12
-- 1
-- 2

-- Query 111
SELECT TeamMember_ID, Team_ID FROM TeamMember;
-- Output:
-- TeamMember_ID | Team_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 2
-- 6 | 2
-- 7 | 2
-- 8 | 2
-- 9 | 3
-- 10 | 3
-- 11 | 3
-- 12 | 3
-- 13 | 4
-- 14 | 4
-- 15 | 4
-- 16 | 4
-- 17 | 5
-- 18 | 5
-- 19 | 5
-- 20 | 5
-- 21 | 6
-- 22 | 6
-- 23 | 6
-- 24 | 6
-- 25 | 7
-- 26 | 7
-- 27 | 7
-- 28 | 7
-- 29 | 8
-- 30 | 8
-- 31 | 8
-- 32 | 8
-- 33 | 9
-- 34 | 9
-- 35 | 9
-- 36 | 9
-- 37 | 10
-- 38 | 10
-- 39 | 10
-- 40 | 10
-- 41 | 11
-- 42 | 11
-- 43 | 11
-- 44 | 11
-- 45 | 12
-- 46 | 12
-- 47 | 12
-- 48 | 12
-- 49 | 1
-- 50 | 2

-- Query 112
SELECT DISTINCT Team_ID FROM TeamMember;
-- Output:
-- Team_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 113
SELECT TeamMember_ID FROM TeamMember ORDER BY TeamMember_ID;
-- Output:
-- TeamMember_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12
-- 13
-- 14
-- 15
-- 16
-- 17
-- 18
-- 19
-- 20
-- 21
-- 22
-- 23
-- 24
-- 25
-- 26
-- 27
-- 28
-- 29
-- 30
-- 31
-- 32
-- 33
-- 34
-- 35
-- 36
-- 37
-- 38
-- 39
-- 40
-- 41
-- 42
-- 43
-- 44
-- 45
-- 46
-- 47
-- 48
-- 49
-- 50

-- Query 114
SELECT TeamMember_ID FROM TeamMember ORDER BY TeamMember_ID DESC;
-- Output:
-- TeamMember_ID
-- 50
-- 49
-- 48
-- 47
-- 46
-- 45
-- 44
-- 43
-- 42
-- 41
-- 40
-- 39
-- 38
-- 37
-- 36
-- 35
-- 34
-- 33
-- 32
-- 31
-- 30
-- 29
-- 28
-- 27
-- 26
-- 25
-- 24
-- 23
-- 22
-- 21
-- 20
-- 19
-- 18
-- 17
-- 16
-- 15
-- 14
-- 13
-- 12
-- 11
-- 10
-- 9
-- 8
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 115
SELECT TeamMember_ID FROM TeamMember WHERE TeamMember_ID = 1;
-- Output:
-- TeamMember_ID
-- 1

-- Query 116
SELECT Team_ID FROM TeamMember WHERE Team_ID = 1;
-- Output:
-- Team_ID
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 117
SELECT Player_ID FROM TeamMember WHERE Player_ID = 1;
-- Output:
-- Player_ID
-- 1

-- Query 118
SELECT DISTINCT Player_ID FROM TeamMember ORDER BY Player_ID;
-- Output:
-- Player_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12
-- 13
-- 14
-- 15
-- 16
-- 17
-- 18
-- 19
-- 20
-- 21
-- 22
-- 23
-- 24
-- 25
-- 26
-- 27
-- 28
-- 29
-- 30
-- 31
-- 32
-- 33
-- 34
-- 35
-- 36
-- 37
-- 38
-- 39
-- 40
-- 41
-- 42
-- 43
-- 44
-- 45
-- 46
-- 47
-- 48
-- 49
-- 50

-- Query 119
SELECT COUNT(*) AS Total_Rows FROM TeamMember;
-- Output:
-- Total_Rows
-- 50

-- Query 120
SELECT Team_ID FROM TeamMember ORDER BY Team_ID;
-- Output:
-- Team_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 2
-- 2
-- 2
-- 2
-- 2
-- 3
-- 3
-- 3
-- 3
-- 4
-- 4
-- 4
-- 4
-- 5
-- 5
-- 5
-- 5
-- 6
-- 6
-- 6
-- 6
-- 7
-- 7
-- 7
-- 7
-- 8
-- 8
-- 8
-- 8
-- 9
-- 9
-- 9
-- 9
-- 10
-- 10
-- 10
-- 10
-- 11
-- 11
-- 11
-- 11
-- 12
-- 12
-- 12
-- 12

-- Query 121
SELECT Team_ID FROM TeamMember ORDER BY Team_ID DESC;
-- Output:
-- Team_ID
-- 12
-- 12
-- 12
-- 12
-- 11
-- 11
-- 11
-- 11
-- 10
-- 10
-- 10
-- 10
-- 9
-- 9
-- 9
-- 9
-- 8
-- 8
-- 8
-- 8
-- 7
-- 7
-- 7
-- 7
-- 6
-- 6
-- 6
-- 6
-- 5
-- 5
-- 5
-- 5
-- 4
-- 4
-- 4
-- 4
-- 3
-- 3
-- 3
-- 3
-- 2
-- 2
-- 2
-- 2
-- 2
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 122
SELECT TeamMember_ID, Player_ID FROM TeamMember ORDER BY Player_ID;
-- Output:
-- TeamMember_ID | Player_ID
-- 1 | 1
-- 2 | 2
-- 3 | 3
-- 4 | 4
-- 5 | 5
-- 6 | 6
-- 7 | 7
-- 8 | 8
-- 9 | 9
-- 10 | 10
-- 11 | 11
-- 12 | 12
-- 13 | 13
-- 14 | 14
-- 15 | 15
-- 16 | 16
-- 17 | 17
-- 18 | 18
-- 19 | 19
-- 20 | 20
-- 21 | 21
-- 22 | 22
-- 23 | 23
-- 24 | 24
-- 25 | 25
-- 26 | 26
-- 27 | 27
-- 28 | 28
-- 29 | 29
-- 30 | 30
-- 31 | 31
-- 32 | 32
-- 33 | 33
-- 34 | 34
-- 35 | 35
-- 36 | 36
-- 37 | 37
-- 38 | 38
-- 39 | 39
-- 40 | 40
-- 41 | 41
-- 42 | 42
-- 43 | 43
-- 44 | 44
-- 45 | 45
-- 46 | 46
-- 47 | 47
-- 48 | 48
-- 49 | 49
-- 50 | 50

-- Query 123
SELECT Player_ID, COUNT(*) AS Total FROM TeamMember GROUP BY Player_ID;
-- Output:
-- Player_ID | Total
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1
-- 13 | 1
-- 14 | 1
-- 15 | 1
-- 16 | 1
-- 17 | 1
-- 18 | 1
-- 19 | 1
-- 20 | 1
-- 21 | 1
-- 22 | 1
-- 23 | 1
-- 24 | 1
-- 25 | 1
-- 26 | 1
-- 27 | 1
-- 28 | 1
-- 29 | 1
-- 30 | 1
-- 31 | 1
-- 32 | 1
-- 33 | 1
-- 34 | 1
-- 35 | 1
-- 36 | 1
-- 37 | 1
-- 38 | 1
-- 39 | 1
-- 40 | 1
-- 41 | 1
-- 42 | 1
-- 43 | 1
-- 44 | 1
-- 45 | 1
-- 46 | 1
-- 47 | 1
-- 48 | 1
-- 49 | 1
-- 50 | 1

-- Query 124
SELECT TeamMember_ID, Team_ID, Player_ID FROM TeamMember;
-- Output:
-- TeamMember_ID | Team_ID | Player_ID
-- 1 | 1 | 1
-- 2 | 1 | 2
-- 3 | 1 | 3
-- 4 | 1 | 4
-- 5 | 2 | 5
-- 6 | 2 | 6
-- 7 | 2 | 7
-- 8 | 2 | 8
-- 9 | 3 | 9
-- 10 | 3 | 10
-- 11 | 3 | 11
-- 12 | 3 | 12
-- 13 | 4 | 13
-- 14 | 4 | 14
-- 15 | 4 | 15
-- 16 | 4 | 16
-- 17 | 5 | 17
-- 18 | 5 | 18
-- 19 | 5 | 19
-- 20 | 5 | 20
-- 21 | 6 | 21
-- 22 | 6 | 22
-- 23 | 6 | 23
-- 24 | 6 | 24
-- 25 | 7 | 25
-- 26 | 7 | 26
-- 27 | 7 | 27
-- 28 | 7 | 28
-- 29 | 8 | 29
-- 30 | 8 | 30
-- 31 | 8 | 31
-- 32 | 8 | 32
-- 33 | 9 | 33
-- 34 | 9 | 34
-- 35 | 9 | 35
-- 36 | 9 | 36
-- 37 | 10 | 37
-- 38 | 10 | 38
-- 39 | 10 | 39
-- 40 | 10 | 40
-- 41 | 11 | 41
-- 42 | 11 | 42
-- 43 | 11 | 43
-- 44 | 11 | 44
-- 45 | 12 | 45
-- 46 | 12 | 46
-- 47 | 12 | 47
-- 48 | 12 | 48
-- 49 | 1 | 49
-- 50 | 2 | 50

-- Query 125
SELECT DISTINCT TeamMember_ID, Team_ID FROM TeamMember;
-- Output:
-- TeamMember_ID | Team_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 2
-- 6 | 2
-- 7 | 2
-- 8 | 2
-- 9 | 3
-- 10 | 3
-- 11 | 3
-- 12 | 3
-- 13 | 4
-- 14 | 4
-- 15 | 4
-- 16 | 4
-- 17 | 5
-- 18 | 5
-- 19 | 5
-- 20 | 5
-- 21 | 6
-- 22 | 6
-- 23 | 6
-- 24 | 6
-- 25 | 7
-- 26 | 7
-- 27 | 7
-- 28 | 7
-- 29 | 8
-- 30 | 8
-- 31 | 8
-- 32 | 8
-- 33 | 9
-- 34 | 9
-- 35 | 9
-- 36 | 9
-- 37 | 10
-- 38 | 10
-- 39 | 10
-- 40 | 10
-- 41 | 11
-- 42 | 11
-- 43 | 11
-- 44 | 11
-- 45 | 12
-- 46 | 12
-- 47 | 12
-- 48 | 12
-- 49 | 1
-- 50 | 2

-- Query 126
SELECT Player_ID FROM TeamMember WHERE Player_ID IS NOT NULL;
-- Output:
-- Player_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12
-- 13
-- 14
-- 15
-- 16
-- 17
-- 18
-- 19
-- 20
-- 21
-- 22
-- 23
-- 24
-- 25
-- 26
-- 27
-- 28
-- 29
-- 30
-- 31
-- 32
-- 33
-- 34
-- 35
-- 36
-- 37
-- 38
-- 39
-- 40
-- 41
-- 42
-- 43
-- 44
-- 45
-- 46
-- 47
-- 48
-- 49
-- 50

-- Query 127
SELECT Registration_ID FROM Registration;
-- Output:
-- Registration_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 128
SELECT Tournament_ID FROM Registration;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 129
SELECT Registration_ID, Tournament_ID FROM Registration;
-- Output:
-- Registration_ID | Tournament_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1

-- Query 130
SELECT DISTINCT Tournament_ID FROM Registration;
-- Output:
-- Tournament_ID
-- 1

-- Query 131
SELECT Registration_ID FROM Registration ORDER BY Registration_ID;
-- Output:
-- Registration_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 132
SELECT Registration_ID FROM Registration ORDER BY Registration_ID DESC;
-- Output:
-- Registration_ID
-- 12
-- 11
-- 10
-- 9
-- 8
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 133
SELECT Registration_ID FROM Registration WHERE Registration_ID = 1;
-- Output:
-- Registration_ID
-- 1

-- Query 134
SELECT Tournament_ID FROM Registration WHERE Tournament_ID = 1;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 135
SELECT Team_ID FROM Registration WHERE Team_ID = 1;
-- Output:
-- Team_ID
-- 1

-- Query 136
SELECT DISTINCT Team_ID FROM Registration ORDER BY Team_ID;
-- Output:
-- Team_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 137
SELECT COUNT(*) AS Total_Rows FROM Registration;
-- Output:
-- Total_Rows
-- 12

-- Query 138
SELECT Tournament_ID FROM Registration ORDER BY Tournament_ID;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 139
SELECT Tournament_ID FROM Registration ORDER BY Tournament_ID DESC;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 140
SELECT Registration_ID, Team_ID FROM Registration ORDER BY Team_ID;
-- Output:
-- Registration_ID | Team_ID
-- 1 | 1
-- 2 | 2
-- 3 | 3
-- 4 | 4
-- 5 | 5
-- 6 | 6
-- 7 | 7
-- 8 | 8
-- 9 | 9
-- 10 | 10
-- 11 | 11
-- 12 | 12

-- Query 141
SELECT Team_ID, COUNT(*) AS Total FROM Registration GROUP BY Team_ID;
-- Output:
-- Team_ID | Total
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1

-- Query 142
SELECT Registration_ID, Tournament_ID, Team_ID FROM Registration;
-- Output:
-- Registration_ID | Tournament_ID | Team_ID
-- 1 | 1 | 1
-- 2 | 1 | 2
-- 3 | 1 | 3
-- 4 | 1 | 4
-- 5 | 1 | 5
-- 6 | 1 | 6
-- 7 | 1 | 7
-- 8 | 1 | 8
-- 9 | 1 | 9
-- 10 | 1 | 10
-- 11 | 1 | 11
-- 12 | 1 | 12

-- Query 143
SELECT DISTINCT Registration_ID, Tournament_ID FROM Registration;
-- Output:
-- Registration_ID | Tournament_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1

-- Query 144
SELECT Team_ID FROM Registration WHERE Team_ID IS NOT NULL;
-- Output:
-- Team_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 145
SELECT Map_ID FROM Map;
-- Output:
-- Map_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10

-- Query 146
SELECT Map_Name FROM Map;
-- Output:
-- Map_Name
-- Bermuda
-- Purgatory
-- Kalahari
-- Alpine
-- NexTerra
-- Solara
-- Bermuda Remastered
-- Kalahari Night
-- Alpine Storm
-- NexTerra City

-- Query 147
SELECT Map_ID, Map_Name FROM Map;
-- Output:
-- Map_ID | Map_Name
-- 1 | Bermuda
-- 2 | Purgatory
-- 3 | Kalahari
-- 4 | Alpine
-- 5 | NexTerra
-- 6 | Solara
-- 7 | Bermuda Remastered
-- 8 | Kalahari Night
-- 9 | Alpine Storm
-- 10 | NexTerra City

-- Query 148
SELECT DISTINCT Map_Name FROM Map;
-- Output:
-- Map_Name
-- Bermuda
-- Purgatory
-- Kalahari
-- Alpine
-- NexTerra
-- Solara
-- Bermuda Remastered
-- Kalahari Night
-- Alpine Storm
-- NexTerra City

-- Query 149
SELECT Map_ID FROM Map ORDER BY Map_ID;
-- Output:
-- Map_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10

-- Query 150
SELECT Map_ID FROM Map ORDER BY Map_ID DESC;
-- Output:
-- Map_ID
-- 10
-- 9
-- 8
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 151
SELECT Map_ID FROM Map WHERE Map_ID = 1;
-- Output:
-- Map_ID
-- 1

-- Query 152
SELECT Map_Name FROM Map WHERE Map_Name = 'Alpine';
-- Output:
-- Map_Name
-- Alpine

-- Query 153
SELECT Map_Code FROM Map WHERE Map_Code = 'MAP001';
-- Output:
-- Map_Code
-- MAP001

-- Query 154
SELECT DISTINCT Map_Code FROM Map ORDER BY Map_Code;
-- Output:
-- Map_Code
-- MAP001
-- MAP002
-- MAP003
-- MAP004
-- MAP005
-- MAP006
-- MAP007
-- MAP008
-- MAP009
-- MAP010

-- Query 155
SELECT COUNT(*) AS Total_Rows FROM Map;
-- Output:
-- Total_Rows
-- 10

-- Query 156
SELECT Map_Name FROM Map ORDER BY Map_Name;
-- Output:
-- Map_Name
-- Alpine
-- Alpine Storm
-- Bermuda
-- Bermuda Remastered
-- Kalahari
-- Kalahari Night
-- NexTerra
-- NexTerra City
-- Purgatory
-- Solara

-- Query 157
SELECT Map_Name FROM Map ORDER BY Map_Name DESC;
-- Output:
-- Map_Name
-- Solara
-- Purgatory
-- NexTerra City
-- NexTerra
-- Kalahari Night
-- Kalahari
-- Bermuda Remastered
-- Bermuda
-- Alpine Storm
-- Alpine

-- Query 158
SELECT Map_ID, Map_Code FROM Map ORDER BY Map_Code;
-- Output:
-- Map_ID | Map_Code
-- 1 | MAP001
-- 2 | MAP002
-- 3 | MAP003
-- 4 | MAP004
-- 5 | MAP005
-- 6 | MAP006
-- 7 | MAP007
-- 8 | MAP008
-- 9 | MAP009
-- 10 | MAP010

-- Query 159
SELECT Map_Code, COUNT(*) AS Total FROM Map GROUP BY Map_Code;
-- Output:
-- Map_Code | Total
-- MAP001 | 1
-- MAP002 | 1
-- MAP003 | 1
-- MAP004 | 1
-- MAP005 | 1
-- MAP006 | 1
-- MAP007 | 1
-- MAP008 | 1
-- MAP009 | 1
-- MAP010 | 1

-- Query 160
SELECT Map_ID, Map_Name, Map_Code FROM Map;
-- Output:
-- Map_ID | Map_Name | Map_Code
-- 1 | Bermuda | MAP001
-- 2 | Purgatory | MAP002
-- 3 | Kalahari | MAP003
-- 4 | Alpine | MAP004
-- 5 | NexTerra | MAP005
-- 6 | Solara | MAP006
-- 7 | Bermuda Remastered | MAP007
-- 8 | Kalahari Night | MAP008
-- 9 | Alpine Storm | MAP009
-- 10 | NexTerra City | MAP010

-- Query 161
SELECT DISTINCT Map_ID, Map_Name FROM Map;
-- Output:
-- Map_ID | Map_Name
-- 1 | Bermuda
-- 2 | Purgatory
-- 3 | Kalahari
-- 4 | Alpine
-- 5 | NexTerra
-- 6 | Solara
-- 7 | Bermuda Remastered
-- 8 | Kalahari Night
-- 9 | Alpine Storm
-- 10 | NexTerra City

-- Query 162
SELECT Map_Code FROM Map WHERE Map_Code IS NOT NULL;
-- Output:
-- Map_Code
-- MAP001
-- MAP002
-- MAP003
-- MAP004
-- MAP005
-- MAP006
-- MAP007
-- MAP008
-- MAP009
-- MAP010

-- Query 163
SELECT Referee_ID FROM Referee;
-- Output:
-- Referee_ID
-- 1
-- 2
-- 3
-- 4
-- 5

-- Query 164
SELECT Referee_Name FROM Referee;
-- Output:
-- Referee_Name
-- Ramesh Kumar
-- Suresh Rao
-- Anil Das
-- Mohan Singh
-- Kiran Nair

-- Query 165
SELECT Referee_ID, Referee_Name FROM Referee;
-- Output:
-- Referee_ID | Referee_Name
-- 1 | Ramesh Kumar
-- 2 | Suresh Rao
-- 3 | Anil Das
-- 4 | Mohan Singh
-- 5 | Kiran Nair

-- Query 166
SELECT DISTINCT Referee_Name FROM Referee;
-- Output:
-- Referee_Name
-- Ramesh Kumar
-- Suresh Rao
-- Anil Das
-- Mohan Singh
-- Kiran Nair

-- Query 167
SELECT Referee_ID FROM Referee ORDER BY Referee_ID;
-- Output:
-- Referee_ID
-- 1
-- 2
-- 3
-- 4
-- 5

-- Query 168
SELECT Referee_ID FROM Referee ORDER BY Referee_ID DESC;
-- Output:
-- Referee_ID
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 169
SELECT Referee_ID FROM Referee WHERE Referee_ID = 1;
-- Output:
-- Referee_ID
-- 1

-- Query 170
SELECT Referee_Name FROM Referee WHERE Referee_Name = 'Anil Das';
-- Output:
-- Referee_Name
-- Anil Das

-- Query 171
SELECT Age FROM Referee WHERE Age = 31;
-- Output:
-- Age
-- 31

-- Query 172
SELECT DISTINCT Age FROM Referee ORDER BY Age;
-- Output:
-- Age
-- 31
-- 32
-- 34
-- 35
-- 38

-- Query 173
SELECT COUNT(*) AS Total_Rows FROM Referee;
-- Output:
-- Total_Rows
-- 5

-- Query 174
SELECT Referee_Name FROM Referee ORDER BY Referee_Name;
-- Output:
-- Referee_Name
-- Anil Das
-- Kiran Nair
-- Mohan Singh
-- Ramesh Kumar
-- Suresh Rao

-- Query 175
SELECT Referee_Name FROM Referee ORDER BY Referee_Name DESC;
-- Output:
-- Referee_Name
-- Suresh Rao
-- Ramesh Kumar
-- Mohan Singh
-- Kiran Nair
-- Anil Das

-- Query 176
SELECT Referee_ID, Age FROM Referee ORDER BY Age;
-- Output:
-- Referee_ID | Age
-- 5 | 31
-- 2 | 32
-- 4 | 34
-- 1 | 35
-- 3 | 38

-- Query 177
SELECT Age, COUNT(*) AS Total FROM Referee GROUP BY Age;
-- Output:
-- Age | Total
-- 31 | 1
-- 32 | 1
-- 34 | 1
-- 35 | 1
-- 38 | 1

-- Query 178
SELECT Referee_ID, Referee_Name, Age FROM Referee;
-- Output:
-- Referee_ID | Referee_Name | Age
-- 1 | Ramesh Kumar | 35
-- 2 | Suresh Rao | 32
-- 3 | Anil Das | 38
-- 4 | Mohan Singh | 34
-- 5 | Kiran Nair | 31

-- Query 179
SELECT DISTINCT Referee_ID, Referee_Name FROM Referee;
-- Output:
-- Referee_ID | Referee_Name
-- 1 | Ramesh Kumar
-- 2 | Suresh Rao
-- 3 | Anil Das
-- 4 | Mohan Singh
-- 5 | Kiran Nair

-- Query 180
SELECT Age FROM Referee WHERE Age IS NOT NULL;
-- Output:
-- Age
-- 35
-- 32
-- 38
-- 34
-- 31

-- Query 181
SELECT Match_ID FROM MatchInfo;
-- Output:
-- Match_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10

-- Query 182
SELECT Tournament_ID FROM MatchInfo;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 183
SELECT Match_ID, Tournament_ID FROM MatchInfo;
-- Output:
-- Match_ID | Tournament_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1

-- Query 184
SELECT DISTINCT Tournament_ID FROM MatchInfo;
-- Output:
-- Tournament_ID
-- 1

-- Query 185
SELECT Match_ID FROM MatchInfo ORDER BY Match_ID;
-- Output:
-- Match_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10

-- Query 186
SELECT Match_ID FROM MatchInfo ORDER BY Match_ID DESC;
-- Output:
-- Match_ID
-- 10
-- 9
-- 8
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 187
SELECT Match_ID FROM MatchInfo WHERE Match_ID = 1;
-- Output:
-- Match_ID
-- 1

-- Query 188
SELECT Tournament_ID FROM MatchInfo WHERE Tournament_ID = 1;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 189
SELECT Match_Number FROM MatchInfo WHERE Match_Number = 1;
-- Output:
-- Match_Number
-- 1

-- Query 190
SELECT DISTINCT Match_Number FROM MatchInfo ORDER BY Match_Number;
-- Output:
-- Match_Number
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10

-- Query 191
SELECT COUNT(*) AS Total_Rows FROM MatchInfo;
-- Output:
-- Total_Rows
-- 10

-- Query 192
SELECT Tournament_ID FROM MatchInfo ORDER BY Tournament_ID;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 193
SELECT Tournament_ID FROM MatchInfo ORDER BY Tournament_ID DESC;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 194
SELECT Match_ID, Match_Number FROM MatchInfo ORDER BY Match_Number;
-- Output:
-- Match_ID | Match_Number
-- 1 | 1
-- 2 | 2
-- 3 | 3
-- 4 | 4
-- 5 | 5
-- 6 | 6
-- 7 | 7
-- 8 | 8
-- 9 | 9
-- 10 | 10

-- Query 195
SELECT Match_Number, COUNT(*) AS Total FROM MatchInfo GROUP BY Match_Number;
-- Output:
-- Match_Number | Total
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1

-- Query 196
SELECT Match_ID, Tournament_ID, Match_Number FROM MatchInfo;
-- Output:
-- Match_ID | Tournament_ID | Match_Number
-- 1 | 1 | 1
-- 2 | 1 | 2
-- 3 | 1 | 3
-- 4 | 1 | 4
-- 5 | 1 | 5
-- 6 | 1 | 6
-- 7 | 1 | 7
-- 8 | 1 | 8
-- 9 | 1 | 9
-- 10 | 1 | 10

-- Query 197
SELECT DISTINCT Match_ID, Tournament_ID FROM MatchInfo;
-- Output:
-- Match_ID | Tournament_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1

-- Query 198
SELECT Match_Number FROM MatchInfo WHERE Match_Number IS NOT NULL;
-- Output:
-- Match_Number
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10

-- Query 199
SELECT MatchTeam_ID FROM MatchTeam;
-- Output:
-- MatchTeam_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 200
SELECT Match_ID FROM MatchTeam;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 201
SELECT MatchTeam_ID, Match_ID FROM MatchTeam;
-- Output:
-- MatchTeam_ID | Match_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1

-- Query 202
SELECT DISTINCT Match_ID FROM MatchTeam;
-- Output:
-- Match_ID
-- 1

-- Query 203
SELECT MatchTeam_ID FROM MatchTeam ORDER BY MatchTeam_ID;
-- Output:
-- MatchTeam_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 204
SELECT MatchTeam_ID FROM MatchTeam ORDER BY MatchTeam_ID DESC;
-- Output:
-- MatchTeam_ID
-- 12
-- 11
-- 10
-- 9
-- 8
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 205
SELECT MatchTeam_ID FROM MatchTeam WHERE MatchTeam_ID = 1;
-- Output:
-- MatchTeam_ID
-- 1

-- Query 206
SELECT Match_ID FROM MatchTeam WHERE Match_ID = 1;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 207
SELECT Team_ID FROM MatchTeam WHERE Team_ID = 1;
-- Output:
-- Team_ID
-- 1

-- Query 208
SELECT DISTINCT Team_ID FROM MatchTeam ORDER BY Team_ID;
-- Output:
-- Team_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 209
SELECT COUNT(*) AS Total_Rows FROM MatchTeam;
-- Output:
-- Total_Rows
-- 12

-- Query 210
SELECT Match_ID FROM MatchTeam ORDER BY Match_ID;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 211
SELECT Match_ID FROM MatchTeam ORDER BY Match_ID DESC;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 212
SELECT MatchTeam_ID, Team_ID FROM MatchTeam ORDER BY Team_ID;
-- Output:
-- MatchTeam_ID | Team_ID
-- 1 | 1
-- 2 | 2
-- 3 | 3
-- 4 | 4
-- 5 | 5
-- 6 | 6
-- 7 | 7
-- 8 | 8
-- 9 | 9
-- 10 | 10
-- 11 | 11
-- 12 | 12

-- Query 213
SELECT Team_ID, COUNT(*) AS Total FROM MatchTeam GROUP BY Team_ID;
-- Output:
-- Team_ID | Total
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1

-- Query 214
SELECT MatchTeam_ID, Match_ID, Team_ID FROM MatchTeam;
-- Output:
-- MatchTeam_ID | Match_ID | Team_ID
-- 1 | 1 | 1
-- 2 | 1 | 2
-- 3 | 1 | 3
-- 4 | 1 | 4
-- 5 | 1 | 5
-- 6 | 1 | 6
-- 7 | 1 | 7
-- 8 | 1 | 8
-- 9 | 1 | 9
-- 10 | 1 | 10
-- 11 | 1 | 11
-- 12 | 1 | 12

-- Query 215
SELECT DISTINCT MatchTeam_ID, Match_ID FROM MatchTeam;
-- Output:
-- MatchTeam_ID | Match_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1

-- Query 216
SELECT Team_ID FROM MatchTeam WHERE Team_ID IS NOT NULL;
-- Output:
-- Team_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 217
SELECT PlayerMatch_ID FROM PlayerMatch;
-- Output:
-- PlayerMatch_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12
-- 13
-- 14
-- 15
-- 16

-- Query 218
SELECT Match_ID FROM PlayerMatch;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 219
SELECT PlayerMatch_ID, Match_ID FROM PlayerMatch;
-- Output:
-- PlayerMatch_ID | Match_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1
-- 13 | 1
-- 14 | 1
-- 15 | 1
-- 16 | 1

-- Query 220
SELECT DISTINCT Match_ID FROM PlayerMatch;
-- Output:
-- Match_ID
-- 1

-- Query 221
SELECT PlayerMatch_ID FROM PlayerMatch ORDER BY PlayerMatch_ID;
-- Output:
-- PlayerMatch_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12
-- 13
-- 14
-- 15
-- 16

-- Query 222
SELECT PlayerMatch_ID FROM PlayerMatch ORDER BY PlayerMatch_ID DESC;
-- Output:
-- PlayerMatch_ID
-- 16
-- 15
-- 14
-- 13
-- 12
-- 11
-- 10
-- 9
-- 8
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 223
SELECT PlayerMatch_ID FROM PlayerMatch WHERE PlayerMatch_ID = 1;
-- Output:
-- PlayerMatch_ID
-- 1

-- Query 224
SELECT Match_ID FROM PlayerMatch WHERE Match_ID = 1;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 225
SELECT Player_ID FROM PlayerMatch WHERE Player_ID = 1;
-- Output:
-- Player_ID
-- 1

-- Query 226
SELECT DISTINCT Player_ID FROM PlayerMatch ORDER BY Player_ID;
-- Output:
-- Player_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12
-- 13
-- 14
-- 15
-- 16

-- Query 227
SELECT COUNT(*) AS Total_Rows FROM PlayerMatch;
-- Output:
-- Total_Rows
-- 16

-- Query 228
SELECT Match_ID FROM PlayerMatch ORDER BY Match_ID;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 229
SELECT Match_ID FROM PlayerMatch ORDER BY Match_ID DESC;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 230
SELECT PlayerMatch_ID, Player_ID FROM PlayerMatch ORDER BY Player_ID;
-- Output:
-- PlayerMatch_ID | Player_ID
-- 1 | 1
-- 2 | 2
-- 3 | 3
-- 4 | 4
-- 5 | 5
-- 6 | 6
-- 7 | 7
-- 8 | 8
-- 9 | 9
-- 10 | 10
-- 11 | 11
-- 12 | 12
-- 13 | 13
-- 14 | 14
-- 15 | 15
-- 16 | 16

-- Query 231
SELECT Player_ID, COUNT(*) AS Total FROM PlayerMatch GROUP BY Player_ID;
-- Output:
-- Player_ID | Total
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1
-- 13 | 1
-- 14 | 1
-- 15 | 1
-- 16 | 1

-- Query 232
SELECT PlayerMatch_ID, Match_ID, Player_ID FROM PlayerMatch;
-- Output:
-- PlayerMatch_ID | Match_ID | Player_ID
-- 1 | 1 | 1
-- 2 | 1 | 2
-- 3 | 1 | 3
-- 4 | 1 | 4
-- 5 | 1 | 5
-- 6 | 1 | 6
-- 7 | 1 | 7
-- 8 | 1 | 8
-- 9 | 1 | 9
-- 10 | 1 | 10
-- 11 | 1 | 11
-- 12 | 1 | 12
-- 13 | 1 | 13
-- 14 | 1 | 14
-- 15 | 1 | 15
-- 16 | 1 | 16

-- Query 233
SELECT DISTINCT PlayerMatch_ID, Match_ID FROM PlayerMatch;
-- Output:
-- PlayerMatch_ID | Match_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1
-- 13 | 1
-- 14 | 1
-- 15 | 1
-- 16 | 1

-- Query 234
SELECT Player_ID FROM PlayerMatch WHERE Player_ID IS NOT NULL;
-- Output:
-- Player_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12
-- 13
-- 14
-- 15
-- 16

-- Query 235
SELECT TeamMatch_ID FROM TeamMatch;
-- Output:
-- TeamMatch_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 236
SELECT Match_ID FROM TeamMatch;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 237
SELECT TeamMatch_ID, Match_ID FROM TeamMatch;
-- Output:
-- TeamMatch_ID | Match_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1

-- Query 238
SELECT DISTINCT Match_ID FROM TeamMatch;
-- Output:
-- Match_ID
-- 1

-- Query 239
SELECT TeamMatch_ID FROM TeamMatch ORDER BY TeamMatch_ID;
-- Output:
-- TeamMatch_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 240
SELECT TeamMatch_ID FROM TeamMatch ORDER BY TeamMatch_ID DESC;
-- Output:
-- TeamMatch_ID
-- 12
-- 11
-- 10
-- 9
-- 8
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 241
SELECT TeamMatch_ID FROM TeamMatch WHERE TeamMatch_ID = 1;
-- Output:
-- TeamMatch_ID
-- 1

-- Query 242
SELECT Match_ID FROM TeamMatch WHERE Match_ID = 1;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 243
SELECT Team_ID FROM TeamMatch WHERE Team_ID = 1;
-- Output:
-- Team_ID
-- 1

-- Query 244
SELECT DISTINCT Team_ID FROM TeamMatch ORDER BY Team_ID;
-- Output:
-- Team_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 245
SELECT COUNT(*) AS Total_Rows FROM TeamMatch;
-- Output:
-- Total_Rows
-- 12

-- Query 246
SELECT Match_ID FROM TeamMatch ORDER BY Match_ID;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 247
SELECT Match_ID FROM TeamMatch ORDER BY Match_ID DESC;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 248
SELECT TeamMatch_ID, Team_ID FROM TeamMatch ORDER BY Team_ID;
-- Output:
-- TeamMatch_ID | Team_ID
-- 1 | 1
-- 2 | 2
-- 3 | 3
-- 4 | 4
-- 5 | 5
-- 6 | 6
-- 7 | 7
-- 8 | 8
-- 9 | 9
-- 10 | 10
-- 11 | 11
-- 12 | 12

-- Query 249
SELECT Team_ID, COUNT(*) AS Total FROM TeamMatch GROUP BY Team_ID;
-- Output:
-- Team_ID | Total
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1

-- Query 250
SELECT TeamMatch_ID, Match_ID, Team_ID FROM TeamMatch;
-- Output:
-- TeamMatch_ID | Match_ID | Team_ID
-- 1 | 1 | 1
-- 2 | 1 | 2
-- 3 | 1 | 3
-- 4 | 1 | 4
-- 5 | 1 | 5
-- 6 | 1 | 6
-- 7 | 1 | 7
-- 8 | 1 | 8
-- 9 | 1 | 9
-- 10 | 1 | 10
-- 11 | 1 | 11
-- 12 | 1 | 12

-- Query 251
SELECT DISTINCT TeamMatch_ID, Match_ID FROM TeamMatch;
-- Output:
-- TeamMatch_ID | Match_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1

-- Query 252
SELECT Team_ID FROM TeamMatch WHERE Team_ID IS NOT NULL;
-- Output:
-- Team_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 253
SELECT Kill_ID FROM KillRecord;
-- Output:
-- Kill_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10

-- Query 254
SELECT Match_ID FROM KillRecord;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 255
SELECT Kill_ID, Match_ID FROM KillRecord;
-- Output:
-- Kill_ID | Match_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1

-- Query 256
SELECT DISTINCT Match_ID FROM KillRecord;
-- Output:
-- Match_ID
-- 1

-- Query 257
SELECT Kill_ID FROM KillRecord ORDER BY Kill_ID;
-- Output:
-- Kill_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10

-- Query 258
SELECT Kill_ID FROM KillRecord ORDER BY Kill_ID DESC;
-- Output:
-- Kill_ID
-- 10
-- 9
-- 8
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 259
SELECT Kill_ID FROM KillRecord WHERE Kill_ID = 1;
-- Output:
-- Kill_ID
-- 1

-- Query 260
SELECT Match_ID FROM KillRecord WHERE Match_ID = 1;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 261
SELECT Killer_ID FROM KillRecord WHERE Killer_ID = 1;
-- Output:
-- Killer_ID
-- 1
-- 1

-- Query 262
SELECT DISTINCT Killer_ID FROM KillRecord ORDER BY Killer_ID;
-- Output:
-- Killer_ID
-- 1
-- 2
-- 3
-- 5
-- 7
-- 9
-- 11
-- 13
-- 15

-- Query 263
SELECT COUNT(*) AS Total_Rows FROM KillRecord;
-- Output:
-- Total_Rows
-- 10

-- Query 264
SELECT Match_ID FROM KillRecord ORDER BY Match_ID;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 265
SELECT Match_ID FROM KillRecord ORDER BY Match_ID DESC;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 266
SELECT Kill_ID, Killer_ID FROM KillRecord ORDER BY Killer_ID;
-- Output:
-- Kill_ID | Killer_ID
-- 1 | 1
-- 2 | 1
-- 10 | 2
-- 3 | 3
-- 4 | 5
-- 5 | 7
-- 6 | 9
-- 7 | 11
-- 8 | 13
-- 9 | 15

-- Query 267
SELECT Killer_ID, COUNT(*) AS Total FROM KillRecord GROUP BY Killer_ID;
-- Output:
-- Killer_ID | Total
-- 1 | 2
-- 2 | 1
-- 3 | 1
-- 5 | 1
-- 7 | 1
-- 9 | 1
-- 11 | 1
-- 13 | 1
-- 15 | 1

-- Query 268
SELECT Kill_ID, Match_ID, Killer_ID FROM KillRecord;
-- Output:
-- Kill_ID | Match_ID | Killer_ID
-- 1 | 1 | 1
-- 2 | 1 | 1
-- 3 | 1 | 3
-- 4 | 1 | 5
-- 5 | 1 | 7
-- 6 | 1 | 9
-- 7 | 1 | 11
-- 8 | 1 | 13
-- 9 | 1 | 15
-- 10 | 1 | 2

-- Query 269
SELECT DISTINCT Kill_ID, Match_ID FROM KillRecord;
-- Output:
-- Kill_ID | Match_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1

-- Query 270
SELECT Killer_ID FROM KillRecord WHERE Killer_ID IS NOT NULL;
-- Output:
-- Killer_ID
-- 1
-- 1
-- 3
-- 5
-- 7
-- 9
-- 11
-- 13
-- 15
-- 2

-- Query 271
SELECT Revive_ID FROM ReviveRecord;
-- Output:
-- Revive_ID
-- 1
-- 2
-- 3
-- 4
-- 5

-- Query 272
SELECT Match_ID FROM ReviveRecord;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 273
SELECT Revive_ID, Match_ID FROM ReviveRecord;
-- Output:
-- Revive_ID | Match_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1

-- Query 274
SELECT DISTINCT Match_ID FROM ReviveRecord;
-- Output:
-- Match_ID
-- 1

-- Query 275
SELECT Revive_ID FROM ReviveRecord ORDER BY Revive_ID;
-- Output:
-- Revive_ID
-- 1
-- 2
-- 3
-- 4
-- 5

-- Query 276
SELECT Revive_ID FROM ReviveRecord ORDER BY Revive_ID DESC;
-- Output:
-- Revive_ID
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 277
SELECT Revive_ID FROM ReviveRecord WHERE Revive_ID = 1;
-- Output:
-- Revive_ID
-- 1

-- Query 278
SELECT Match_ID FROM ReviveRecord WHERE Match_ID = 1;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 279
SELECT Reviver_ID FROM ReviveRecord WHERE Reviver_ID = 4;
-- Output:
-- Reviver_ID
-- 4
-- 4

-- Query 280
SELECT DISTINCT Reviver_ID FROM ReviveRecord ORDER BY Reviver_ID;
-- Output:
-- Reviver_ID
-- 4
-- 8
-- 12
-- 16

-- Query 281
SELECT COUNT(*) AS Total_Rows FROM ReviveRecord;
-- Output:
-- Total_Rows
-- 5

-- Query 282
SELECT Match_ID FROM ReviveRecord ORDER BY Match_ID;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 283
SELECT Match_ID FROM ReviveRecord ORDER BY Match_ID DESC;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 284
SELECT Revive_ID, Reviver_ID FROM ReviveRecord ORDER BY Reviver_ID;
-- Output:
-- Revive_ID | Reviver_ID
-- 1 | 4
-- 5 | 4
-- 2 | 8
-- 3 | 12
-- 4 | 16

-- Query 285
SELECT Reviver_ID, COUNT(*) AS Total FROM ReviveRecord GROUP BY Reviver_ID;
-- Output:
-- Reviver_ID | Total
-- 4 | 2
-- 8 | 1
-- 12 | 1
-- 16 | 1

-- Query 286
SELECT Revive_ID, Match_ID, Reviver_ID FROM ReviveRecord;
-- Output:
-- Revive_ID | Match_ID | Reviver_ID
-- 1 | 1 | 4
-- 2 | 1 | 8
-- 3 | 1 | 12
-- 4 | 1 | 16
-- 5 | 1 | 4

-- Query 287
SELECT DISTINCT Revive_ID, Match_ID FROM ReviveRecord;
-- Output:
-- Revive_ID | Match_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1

-- Query 288
SELECT Reviver_ID FROM ReviveRecord WHERE Reviver_ID IS NOT NULL;
-- Output:
-- Reviver_ID
-- 4
-- 8
-- 12
-- 16
-- 4

-- Query 289
SELECT Zone_ID FROM ZoneStatus;
-- Output:
-- Zone_ID
-- 1
-- 2
-- 3
-- 4
-- 5

-- Query 290
SELECT Match_ID FROM ZoneStatus;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 291
SELECT Zone_ID, Match_ID FROM ZoneStatus;
-- Output:
-- Zone_ID | Match_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1

-- Query 292
SELECT DISTINCT Match_ID FROM ZoneStatus;
-- Output:
-- Match_ID
-- 1

-- Query 293
SELECT Zone_ID FROM ZoneStatus ORDER BY Zone_ID;
-- Output:
-- Zone_ID
-- 1
-- 2
-- 3
-- 4
-- 5

-- Query 294
SELECT Zone_ID FROM ZoneStatus ORDER BY Zone_ID DESC;
-- Output:
-- Zone_ID
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 295
SELECT Zone_ID FROM ZoneStatus WHERE Zone_ID = 1;
-- Output:
-- Zone_ID
-- 1

-- Query 296
SELECT Match_ID FROM ZoneStatus WHERE Match_ID = 1;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 297
SELECT Zone_Number FROM ZoneStatus WHERE Zone_Number = 1;
-- Output:
-- Zone_Number
-- 1

-- Query 298
SELECT DISTINCT Zone_Number FROM ZoneStatus ORDER BY Zone_Number;
-- Output:
-- Zone_Number
-- 1
-- 2
-- 3
-- 4
-- 5

-- Query 299
SELECT COUNT(*) AS Total_Rows FROM ZoneStatus;
-- Output:
-- Total_Rows
-- 5

-- Query 300
SELECT Match_ID FROM ZoneStatus ORDER BY Match_ID;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 301
SELECT Match_ID FROM ZoneStatus ORDER BY Match_ID DESC;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 302
SELECT Zone_ID, Zone_Number FROM ZoneStatus ORDER BY Zone_Number;
-- Output:
-- Zone_ID | Zone_Number
-- 1 | 1
-- 2 | 2
-- 3 | 3
-- 4 | 4
-- 5 | 5

-- Query 303
SELECT Zone_Number, COUNT(*) AS Total FROM ZoneStatus GROUP BY Zone_Number;
-- Output:
-- Zone_Number | Total
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1

-- Query 304
SELECT Zone_ID, Match_ID, Zone_Number FROM ZoneStatus;
-- Output:
-- Zone_ID | Match_ID | Zone_Number
-- 1 | 1 | 1
-- 2 | 1 | 2
-- 3 | 1 | 3
-- 4 | 1 | 4
-- 5 | 1 | 5

-- Query 305
SELECT DISTINCT Zone_ID, Match_ID FROM ZoneStatus;
-- Output:
-- Zone_ID | Match_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1

-- Query 306
SELECT Zone_Number FROM ZoneStatus WHERE Zone_Number IS NOT NULL;
-- Output:
-- Zone_Number
-- 1
-- 2
-- 3
-- 4
-- 5

-- Query 307
SELECT Ranking_ID FROM Ranking;
-- Output:
-- Ranking_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 308
SELECT Tournament_ID FROM Ranking;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 309
SELECT Ranking_ID, Tournament_ID FROM Ranking;
-- Output:
-- Ranking_ID | Tournament_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1

-- Query 310
SELECT DISTINCT Tournament_ID FROM Ranking;
-- Output:
-- Tournament_ID
-- 1

-- Query 311
SELECT Ranking_ID FROM Ranking ORDER BY Ranking_ID;
-- Output:
-- Ranking_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 312
SELECT Ranking_ID FROM Ranking ORDER BY Ranking_ID DESC;
-- Output:
-- Ranking_ID
-- 12
-- 11
-- 10
-- 9
-- 8
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 313
SELECT Ranking_ID FROM Ranking WHERE Ranking_ID = 1;
-- Output:
-- Ranking_ID
-- 1

-- Query 314
SELECT Tournament_ID FROM Ranking WHERE Tournament_ID = 1;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 315
SELECT Match_ID FROM Ranking WHERE Match_ID = 1;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 316
SELECT DISTINCT Match_ID FROM Ranking ORDER BY Match_ID;
-- Output:
-- Match_ID
-- 1

-- Query 317
SELECT COUNT(*) AS Total_Rows FROM Ranking;
-- Output:
-- Total_Rows
-- 12

-- Query 318
SELECT Tournament_ID FROM Ranking ORDER BY Tournament_ID;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 319
SELECT Tournament_ID FROM Ranking ORDER BY Tournament_ID DESC;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 320
SELECT Ranking_ID, Match_ID FROM Ranking ORDER BY Match_ID;
-- Output:
-- Ranking_ID | Match_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1

-- Query 321
SELECT Match_ID, COUNT(*) AS Total FROM Ranking GROUP BY Match_ID;
-- Output:
-- Match_ID | Total
-- 1 | 12

-- Query 322
SELECT Ranking_ID, Tournament_ID, Match_ID FROM Ranking;
-- Output:
-- Ranking_ID | Tournament_ID | Match_ID
-- 1 | 1 | 1
-- 2 | 1 | 1
-- 3 | 1 | 1
-- 4 | 1 | 1
-- 5 | 1 | 1
-- 6 | 1 | 1
-- 7 | 1 | 1
-- 8 | 1 | 1
-- 9 | 1 | 1
-- 10 | 1 | 1
-- 11 | 1 | 1
-- 12 | 1 | 1

-- Query 323
SELECT DISTINCT Ranking_ID, Tournament_ID FROM Ranking;
-- Output:
-- Ranking_ID | Tournament_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1

-- Query 324
SELECT Match_ID FROM Ranking WHERE Match_ID IS NOT NULL;
-- Output:
-- Match_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 325
SELECT Prize_ID FROM Prize;
-- Output:
-- Prize_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6

-- Query 326
SELECT Prize_Name FROM Prize;
-- Output:
-- Prize_Name
-- Championship Prize
-- Championship Prize
-- Championship Prize
-- MVP Award
-- Best Rusher
-- Best Sniper

-- Query 327
SELECT Prize_ID, Prize_Name FROM Prize;
-- Output:
-- Prize_ID | Prize_Name
-- 1 | Championship Prize
-- 2 | Championship Prize
-- 3 | Championship Prize
-- 4 | MVP Award
-- 5 | Best Rusher
-- 6 | Best Sniper

-- Query 328
SELECT DISTINCT Prize_Name FROM Prize;
-- Output:
-- Prize_Name
-- Championship Prize
-- MVP Award
-- Best Rusher
-- Best Sniper

-- Query 329
SELECT Prize_ID FROM Prize ORDER BY Prize_ID;
-- Output:
-- Prize_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6

-- Query 330
SELECT Prize_ID FROM Prize ORDER BY Prize_ID DESC;
-- Output:
-- Prize_ID
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 331
SELECT Prize_ID FROM Prize WHERE Prize_ID = 1;
-- Output:
-- Prize_ID
-- 1

-- Query 332
SELECT Prize_Name FROM Prize WHERE Prize_Name = 'Best Rusher';
-- Output:
-- Prize_Name
-- Best Rusher

-- Query 333
SELECT Position FROM Prize WHERE Position = 1;
-- Output:
-- Position
-- 1
-- 1
-- 1
-- 1

-- Query 334
SELECT DISTINCT Position FROM Prize ORDER BY Position;
-- Output:
-- Position
-- 1
-- 2
-- 3

-- Query 335
SELECT COUNT(*) AS Total_Rows FROM Prize;
-- Output:
-- Total_Rows
-- 6

-- Query 336
SELECT Prize_Name FROM Prize ORDER BY Prize_Name;
-- Output:
-- Prize_Name
-- Best Rusher
-- Best Sniper
-- Championship Prize
-- Championship Prize
-- Championship Prize
-- MVP Award

-- Query 337
SELECT Prize_Name FROM Prize ORDER BY Prize_Name DESC;
-- Output:
-- Prize_Name
-- MVP Award
-- Championship Prize
-- Championship Prize
-- Championship Prize
-- Best Sniper
-- Best Rusher

-- Query 338
SELECT Prize_ID, Position FROM Prize ORDER BY Position;
-- Output:
-- Prize_ID | Position
-- 1 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 2 | 2
-- 3 | 3

-- Query 339
SELECT Position, COUNT(*) AS Total FROM Prize GROUP BY Position;
-- Output:
-- Position | Total
-- 1 | 4
-- 2 | 1
-- 3 | 1

-- Query 340
SELECT Prize_ID, Prize_Name, Position FROM Prize;
-- Output:
-- Prize_ID | Prize_Name | Position
-- 1 | Championship Prize | 1
-- 2 | Championship Prize | 2
-- 3 | Championship Prize | 3
-- 4 | MVP Award | 1
-- 5 | Best Rusher | 1
-- 6 | Best Sniper | 1

-- Query 341
SELECT DISTINCT Prize_ID, Prize_Name FROM Prize;
-- Output:
-- Prize_ID | Prize_Name
-- 1 | Championship Prize
-- 2 | Championship Prize
-- 3 | Championship Prize
-- 4 | MVP Award
-- 5 | Best Rusher
-- 6 | Best Sniper

-- Query 342
SELECT Position FROM Prize WHERE Position IS NOT NULL;
-- Output:
-- Position
-- 1
-- 2
-- 3
-- 1
-- 1
-- 1

-- Query 343
SELECT Statistics_ID FROM PlayerStatistics;
-- Output:
-- Statistics_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10

-- Query 344
SELECT Player_ID FROM PlayerStatistics;
-- Output:
-- Player_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10

-- Query 345
SELECT Statistics_ID, Player_ID FROM PlayerStatistics;
-- Output:
-- Statistics_ID | Player_ID
-- 1 | 1
-- 2 | 2
-- 3 | 3
-- 4 | 4
-- 5 | 5
-- 6 | 6
-- 7 | 7
-- 8 | 8
-- 9 | 9
-- 10 | 10

-- Query 346
SELECT DISTINCT Player_ID FROM PlayerStatistics;
-- Output:
-- Player_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10

-- Query 347
SELECT Statistics_ID FROM PlayerStatistics ORDER BY Statistics_ID;
-- Output:
-- Statistics_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10

-- Query 348
SELECT Statistics_ID FROM PlayerStatistics ORDER BY Statistics_ID DESC;
-- Output:
-- Statistics_ID
-- 10
-- 9
-- 8
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 349
SELECT Statistics_ID FROM PlayerStatistics WHERE Statistics_ID = 1;
-- Output:
-- Statistics_ID
-- 1

-- Query 350
SELECT Player_ID FROM PlayerStatistics WHERE Player_ID = 1;
-- Output:
-- Player_ID
-- 1

-- Query 351
SELECT Tournament_ID FROM PlayerStatistics WHERE Tournament_ID = 1;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 352
SELECT DISTINCT Tournament_ID FROM PlayerStatistics ORDER BY Tournament_ID;
-- Output:
-- Tournament_ID
-- 1

-- Query 353
SELECT COUNT(*) AS Total_Rows FROM PlayerStatistics;
-- Output:
-- Total_Rows
-- 10

-- Query 354
SELECT Player_ID FROM PlayerStatistics ORDER BY Player_ID;
-- Output:
-- Player_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10

-- Query 355
SELECT Player_ID FROM PlayerStatistics ORDER BY Player_ID DESC;
-- Output:
-- Player_ID
-- 10
-- 9
-- 8
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 356
SELECT Statistics_ID, Tournament_ID FROM PlayerStatistics ORDER BY Tournament_ID;
-- Output:
-- Statistics_ID | Tournament_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1

-- Query 357
SELECT Tournament_ID, COUNT(*) AS Total FROM PlayerStatistics GROUP BY Tournament_ID;
-- Output:
-- Tournament_ID | Total
-- 1 | 10

-- Query 358
SELECT Statistics_ID, Player_ID, Tournament_ID FROM PlayerStatistics;
-- Output:
-- Statistics_ID | Player_ID | Tournament_ID
-- 1 | 1 | 1
-- 2 | 2 | 1
-- 3 | 3 | 1
-- 4 | 4 | 1
-- 5 | 5 | 1
-- 6 | 6 | 1
-- 7 | 7 | 1
-- 8 | 8 | 1
-- 9 | 9 | 1
-- 10 | 10 | 1

-- Query 359
SELECT DISTINCT Statistics_ID, Player_ID FROM PlayerStatistics;
-- Output:
-- Statistics_ID | Player_ID
-- 1 | 1
-- 2 | 2
-- 3 | 3
-- 4 | 4
-- 5 | 5
-- 6 | 6
-- 7 | 7
-- 8 | 8
-- 9 | 9
-- 10 | 10

-- Query 360
SELECT Tournament_ID FROM PlayerStatistics WHERE Tournament_ID IS NOT NULL;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 361
SELECT Leaderboard_ID FROM Leaderboard;
-- Output:
-- Leaderboard_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 362
SELECT Tournament_ID FROM Leaderboard;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 363
SELECT Leaderboard_ID, Tournament_ID FROM Leaderboard;
-- Output:
-- Leaderboard_ID | Tournament_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1

-- Query 364
SELECT DISTINCT Tournament_ID FROM Leaderboard;
-- Output:
-- Tournament_ID
-- 1

-- Query 365
SELECT Leaderboard_ID FROM Leaderboard ORDER BY Leaderboard_ID;
-- Output:
-- Leaderboard_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 366
SELECT Leaderboard_ID FROM Leaderboard ORDER BY Leaderboard_ID DESC;
-- Output:
-- Leaderboard_ID
-- 12
-- 11
-- 10
-- 9
-- 8
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1

-- Query 367
SELECT Leaderboard_ID FROM Leaderboard WHERE Leaderboard_ID = 1;
-- Output:
-- Leaderboard_ID
-- 1

-- Query 368
SELECT Tournament_ID FROM Leaderboard WHERE Tournament_ID = 1;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 369
SELECT Player_ID FROM Leaderboard WHERE Player_ID = 1;
-- Output:
-- Player_ID
-- 1

-- Query 370
SELECT DISTINCT Player_ID FROM Leaderboard ORDER BY Player_ID;
-- Output:
-- Player_ID
-- 1
-- 3
-- 5
-- 7
-- 9
-- 11
-- 13
-- 17
-- 21
-- 25
-- 29
-- 33

-- Query 371
SELECT COUNT(*) AS Total_Rows FROM Leaderboard;
-- Output:
-- Total_Rows
-- 12

-- Query 372
SELECT Tournament_ID FROM Leaderboard ORDER BY Tournament_ID;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 373
SELECT Tournament_ID FROM Leaderboard ORDER BY Tournament_ID DESC;
-- Output:
-- Tournament_ID
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1
-- 1

-- Query 374
SELECT Leaderboard_ID, Player_ID FROM Leaderboard ORDER BY Player_ID;
-- Output:
-- Leaderboard_ID | Player_ID
-- 1 | 1
-- 2 | 3
-- 3 | 5
-- 4 | 7
-- 5 | 9
-- 6 | 11
-- 7 | 13
-- 8 | 17
-- 9 | 21
-- 10 | 25
-- 11 | 29
-- 12 | 33

-- Query 375
SELECT Player_ID, COUNT(*) AS Total FROM Leaderboard GROUP BY Player_ID;
-- Output:
-- Player_ID | Total
-- 1 | 1
-- 3 | 1
-- 5 | 1
-- 7 | 1
-- 9 | 1
-- 11 | 1
-- 13 | 1
-- 17 | 1
-- 21 | 1
-- 25 | 1
-- 29 | 1
-- 33 | 1

-- Query 376
SELECT Leaderboard_ID, Tournament_ID, Player_ID FROM Leaderboard;
-- Output:
-- Leaderboard_ID | Tournament_ID | Player_ID
-- 1 | 1 | 1
-- 2 | 1 | 3
-- 3 | 1 | 5
-- 4 | 1 | 7
-- 5 | 1 | 9
-- 6 | 1 | 11
-- 7 | 1 | 13
-- 8 | 1 | 17
-- 9 | 1 | 21
-- 10 | 1 | 25
-- 11 | 1 | 29
-- 12 | 1 | 33

-- Query 377
SELECT DISTINCT Leaderboard_ID, Tournament_ID FROM Leaderboard;
-- Output:
-- Leaderboard_ID | Tournament_ID
-- 1 | 1
-- 2 | 1
-- 3 | 1
-- 4 | 1
-- 5 | 1
-- 6 | 1
-- 7 | 1
-- 8 | 1
-- 9 | 1
-- 10 | 1
-- 11 | 1
-- 12 | 1

-- Query 378
SELECT Player_ID FROM Leaderboard WHERE Player_ID IS NOT NULL;
-- Output:
-- Player_ID
-- 1
-- 3
-- 5
-- 7
-- 9
-- 11
-- 13
-- 17
-- 21
-- 25
-- 29
-- 33

-- Query 379
SELECT SUM(Organizer_ID) AS Total_Organizer_ID FROM Organizer;
-- Output:
-- Total_Organizer_ID
-- 15

-- Query 380
SELECT AVG(Organizer_ID) AS Average_Organizer_ID FROM Organizer;
-- Output:
-- Average_Organizer_ID
-- 3

-- Query 381
SELECT MAX(Organizer_ID) AS Maximum_Organizer_ID FROM Organizer;
-- Output:
-- Maximum_Organizer_ID
-- 5

-- Query 382
SELECT MIN(Organizer_ID) AS Minimum_Organizer_ID FROM Organizer;
-- Output:
-- Minimum_Organizer_ID
-- 1

-- Query 383
SELECT Organizer_ID FROM Organizer WHERE Organizer_ID > 0 ORDER BY Organizer_ID;
-- Output:
-- Organizer_ID
-- 1
-- 2
-- 3
-- 4
-- 5

-- Query 384
SELECT SUM(Experience_Years) AS Total_Experience_Years FROM Organizer;
-- Output:
-- Total_Experience_Years
-- 30

-- Query 385
SELECT AVG(Experience_Years) AS Average_Experience_Years FROM Organizer;
-- Output:
-- Average_Experience_Years
-- 6

-- Query 386
SELECT MAX(Experience_Years) AS Maximum_Experience_Years FROM Organizer;
-- Output:
-- Maximum_Experience_Years
-- 8

-- Query 387
SELECT MIN(Experience_Years) AS Minimum_Experience_Years FROM Organizer;
-- Output:
-- Minimum_Experience_Years
-- 4

-- Query 388
SELECT Experience_Years FROM Organizer WHERE Experience_Years > 0 ORDER BY Experience_Years;
-- Output:
-- Experience_Years
-- 4
-- 5
-- 6
-- 7
-- 8

-- Query 389
SELECT SUM(Sponsor_ID) AS Total_Sponsor_ID FROM Sponsor;
-- Output:
-- Total_Sponsor_ID
-- 15

-- Query 390
SELECT AVG(Sponsor_ID) AS Average_Sponsor_ID FROM Sponsor;
-- Output:
-- Average_Sponsor_ID
-- 3

-- Query 391
SELECT MAX(Sponsor_ID) AS Maximum_Sponsor_ID FROM Sponsor;
-- Output:
-- Maximum_Sponsor_ID
-- 5

-- Query 392
SELECT MIN(Sponsor_ID) AS Minimum_Sponsor_ID FROM Sponsor;
-- Output:
-- Minimum_Sponsor_ID
-- 1

-- Query 393
SELECT Sponsor_ID FROM Sponsor WHERE Sponsor_ID > 0 ORDER BY Sponsor_ID;
-- Output:
-- Sponsor_ID
-- 1
-- 2
-- 3
-- 4
-- 5

-- Query 394
SELECT SUM(Sponsorship_Amount) AS Total_Sponsorship_Amount FROM Sponsor;
-- Output:
-- Total_Sponsorship_Amount
-- 540000

-- Query 395
SELECT AVG(Sponsorship_Amount) AS Average_Sponsorship_Amount FROM Sponsor;
-- Output:
-- Average_Sponsorship_Amount
-- 108000

-- Query 396
SELECT MAX(Sponsorship_Amount) AS Maximum_Sponsorship_Amount FROM Sponsor;
-- Output:
-- Maximum_Sponsorship_Amount
-- 150000

-- Query 397
SELECT MIN(Sponsorship_Amount) AS Minimum_Sponsorship_Amount FROM Sponsor;
-- Output:
-- Minimum_Sponsorship_Amount
-- 80000

-- Query 398
SELECT Sponsorship_Amount FROM Sponsor WHERE Sponsorship_Amount > 0 ORDER BY Sponsorship_Amount;
-- Output:
-- Sponsorship_Amount
-- 80000
-- 90000
-- 100000
-- 120000
-- 150000

-- Query 399
SELECT SUM(Player_ID) AS Total_Player_ID FROM Player;
-- Output:
-- Total_Player_ID
-- 1275

-- Query 400
SELECT AVG(Player_ID) AS Average_Player_ID FROM Player;
-- Output:
-- Average_Player_ID
-- 25.5

-- Query 401
SELECT MAX(Player_ID) AS Maximum_Player_ID FROM Player;
-- Output:
-- Maximum_Player_ID
-- 50

-- Query 402
SELECT MIN(Player_ID) AS Minimum_Player_ID FROM Player;
-- Output:
-- Minimum_Player_ID
-- 1

-- Query 403
SELECT Player_ID FROM Player WHERE Player_ID > 0 ORDER BY Player_ID;
-- Output:
-- Player_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12
-- 13
-- 14
-- 15
-- 16
-- 17
-- 18
-- 19
-- 20
-- 21
-- 22
-- 23
-- 24
-- 25
-- 26
-- 27
-- 28
-- 29
-- 30
-- 31
-- 32
-- 33
-- 34
-- 35
-- 36
-- 37
-- 38
-- 39
-- 40
-- 41
-- 42
-- 43
-- 44
-- 45
-- 46
-- 47
-- 48
-- 49
-- 50

-- Query 404
SELECT SUM(Age) AS Total_Age FROM Player;
-- Output:
-- Total_Age
-- 1073

-- Query 405
SELECT AVG(Age) AS Average_Age FROM Player;
-- Output:
-- Average_Age
-- 21.46

-- Query 406
SELECT MAX(Age) AS Maximum_Age FROM Player;
-- Output:
-- Maximum_Age
-- 23

-- Query 407
SELECT MIN(Age) AS Minimum_Age FROM Player;
-- Output:
-- Minimum_Age
-- 20

-- Query 408
SELECT Age FROM Player WHERE Age > 0 ORDER BY Age;
-- Output:
-- Age
-- 20
-- 20
-- 20
-- 20
-- 20
-- 20
-- 20
-- 20
-- 20
-- 20
-- 21
-- 21
-- 21
-- 21
-- 21
-- 21
-- 21
-- 21
-- 21
-- 21
-- 21
-- 21
-- 21
-- 21
-- 21
-- 21
-- 22
-- 22
-- 22
-- 22
-- 22
-- 22
-- 22
-- 22
-- 22
-- 22
-- 22
-- 22
-- 22
-- 22
-- 22
-- 23
-- 23
-- 23
-- 23
-- 23
-- 23
-- 23
-- 23
-- 23

-- Query 409
SELECT SUM(Experience_Years) AS Total_Experience_Years FROM Player;
-- Output:
-- Total_Experience_Years
-- 173

-- Query 410
SELECT AVG(Experience_Years) AS Average_Experience_Years FROM Player;
-- Output:
-- Average_Experience_Years
-- 3.46

-- Query 411
SELECT MAX(Experience_Years) AS Maximum_Experience_Years FROM Player;
-- Output:
-- Maximum_Experience_Years
-- 5

-- Query 412
SELECT MIN(Experience_Years) AS Minimum_Experience_Years FROM Player;
-- Output:
-- Minimum_Experience_Years
-- 2

-- Query 413
SELECT Experience_Years FROM Player WHERE Experience_Years > 0 ORDER BY Experience_Years;
-- Output:
-- Experience_Years
-- 2
-- 2
-- 2
-- 2
-- 2
-- 2
-- 2
-- 2
-- 2
-- 2
-- 3
-- 3
-- 3
-- 3
-- 3
-- 3
-- 3
-- 3
-- 3
-- 3
-- 3
-- 3
-- 3
-- 3
-- 3
-- 3
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 5
-- 5
-- 5
-- 5
-- 5
-- 5
-- 5
-- 5
-- 5

-- Query 414
SELECT SUM(Team_ID) AS Total_Team_ID FROM Team;
-- Output:
-- Total_Team_ID
-- 78

-- Query 415
SELECT AVG(Team_ID) AS Average_Team_ID FROM Team;
-- Output:
-- Average_Team_ID
-- 6.5

-- Query 416
SELECT MAX(Team_ID) AS Maximum_Team_ID FROM Team;
-- Output:
-- Maximum_Team_ID
-- 12

-- Query 417
SELECT MIN(Team_ID) AS Minimum_Team_ID FROM Team;
-- Output:
-- Minimum_Team_ID
-- 1

-- Query 418
SELECT Team_ID FROM Team WHERE Team_ID > 0 ORDER BY Team_ID;
-- Output:
-- Team_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 419
SELECT SUM(Captain_ID) AS Total_Captain_ID FROM Team;
-- Output:
-- Total_Captain_ID
-- 276

-- Query 420
SELECT AVG(Captain_ID) AS Average_Captain_ID FROM Team;
-- Output:
-- Average_Captain_ID
-- 23

-- Query 421
SELECT MAX(Captain_ID) AS Maximum_Captain_ID FROM Team;
-- Output:
-- Maximum_Captain_ID
-- 45

-- Query 422
SELECT MIN(Captain_ID) AS Minimum_Captain_ID FROM Team;
-- Output:
-- Minimum_Captain_ID
-- 1

-- Query 423
SELECT Captain_ID FROM Team WHERE Captain_ID > 0 ORDER BY Captain_ID;
-- Output:
-- Captain_ID
-- 1
-- 5
-- 9
-- 13
-- 17
-- 21
-- 25
-- 29
-- 33
-- 37
-- 41
-- 45

-- Query 424
SELECT SUM(Total_Players) AS Total_Total_Players FROM Team;
-- Output:
-- Total_Total_Players
-- 48

-- Query 425
SELECT AVG(Total_Players) AS Average_Total_Players FROM Team;
-- Output:
-- Average_Total_Players
-- 4

-- Query 426
SELECT MAX(Total_Players) AS Maximum_Total_Players FROM Team;
-- Output:
-- Maximum_Total_Players
-- 4

-- Query 427
SELECT MIN(Total_Players) AS Minimum_Total_Players FROM Team;
-- Output:
-- Minimum_Total_Players
-- 4

-- Query 428
SELECT Total_Players FROM Team WHERE Total_Players > 0 ORDER BY Total_Players;
-- Output:
-- Total_Players
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4
-- 4

-- Query 429
SELECT SUM(Team_Rank) AS Total_Team_Rank FROM Team;
-- Output:
-- Total_Team_Rank
-- 78

-- Query 430
SELECT AVG(Team_Rank) AS Average_Team_Rank FROM Team;
-- Output:
-- Average_Team_Rank
-- 6.5

-- Query 431
SELECT MAX(Team_Rank) AS Maximum_Team_Rank FROM Team;
-- Output:
-- Maximum_Team_Rank
-- 12

-- Query 432
SELECT MIN(Team_Rank) AS Minimum_Team_Rank FROM Team;
-- Output:
-- Minimum_Team_Rank
-- 1

-- Query 433
SELECT Team_Rank FROM Team WHERE Team_Rank > 0 ORDER BY Team_Rank;
-- Output:
-- Team_Rank
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10
-- 11
-- 12

-- Query 434
SELECT SUM(Role_ID) AS Total_Role_ID FROM Role;
-- Output:
-- Total_Role_ID
-- 10

-- Query 435
SELECT AVG(Role_ID) AS Average_Role_ID FROM Role;
-- Output:
-- Average_Role_ID
-- 2.5

-- Query 436
SELECT MAX(Role_ID) AS Maximum_Role_ID FROM Role;
-- Output:
-- Maximum_Role_ID
-- 4

-- Query 437
SELECT MIN(Role_ID) AS Minimum_Role_ID FROM Role;
-- Output:
-- Minimum_Role_ID
-- 1

-- Query 438
SELECT Role_ID FROM Role WHERE Role_ID > 0 ORDER BY Role_ID;
-- Output:
-- Role_ID
-- 1
-- 2
-- 3
-- 4

-- Query 439
SELECT SUM(Attack_Level) AS Total_Attack_Level FROM Role;
-- Output:
-- Total_Attack_Level
-- 27

-- Query 440
SELECT AVG(Attack_Level) AS Average_Attack_Level FROM Role;
-- Output:
-- Average_Attack_Level
-- 6.75

-- Query 441
SELECT MAX(Attack_Level) AS Maximum_Attack_Level FROM Role;
-- Output:
-- Maximum_Attack_Level
-- 10

-- Query 442
SELECT MIN(Attack_Level) AS Minimum_Attack_Level FROM Role;
-- Output:
-- Minimum_Attack_Level
-- 4

-- Query 443
SELECT Attack_Level FROM Role WHERE Attack_Level > 0 ORDER BY Attack_Level;
-- Output:
-- Attack_Level
-- 4
-- 5
-- 8
-- 10

-- Query 444
SELECT SUM(Defense_Level) AS Total_Defense_Level FROM Role;
-- Output:
-- Total_Defense_Level
-- 28

-- Query 445
SELECT AVG(Defense_Level) AS Average_Defense_Level FROM Role;
-- Output:
-- Average_Defense_Level
-- 7

-- Query 446
SELECT MAX(Defense_Level) AS Maximum_Defense_Level FROM Role;
-- Output:
-- Maximum_Defense_Level
-- 9

-- Query 447
SELECT MIN(Defense_Level) AS Minimum_Defense_Level FROM Role;
-- Output:
-- Minimum_Defense_Level
-- 5

-- Query 448
SELECT Defense_Level FROM Role WHERE Defense_Level > 0 ORDER BY Defense_Level;
-- Output:
-- Defense_Level
-- 5
-- 6
-- 8
-- 9

-- Query 449
SELECT SUM(Support_Level) AS Total_Support_Level FROM Role;
-- Output:
-- Total_Support_Level
-- 28

-- Query 450
SELECT AVG(Support_Level) AS Average_Support_Level FROM Role;
-- Output:
-- Average_Support_Level
-- 7

-- Query 451
SELECT MAX(Support_Level) AS Maximum_Support_Level FROM Role;
-- Output:
-- Maximum_Support_Level
-- 10

-- Query 452
SELECT MIN(Support_Level) AS Minimum_Support_Level FROM Role;
-- Output:
-- Minimum_Support_Level
-- 4

-- Query 453
SELECT Support_Level FROM Role WHERE Support_Level > 0 ORDER BY Support_Level;
-- Output:
-- Support_Level
-- 4
-- 4
-- 10
-- 10

-- Query 454
SELECT SUM(Long_Range_Level) AS Total_Long_Range_Level FROM Role;
-- Output:
-- Total_Long_Range_Level
-- 26

-- Query 455
SELECT AVG(Long_Range_Level) AS Average_Long_Range_Level FROM Role;
-- Output:
-- Average_Long_Range_Level
-- 6.5

-- Query 456
SELECT MAX(Long_Range_Level) AS Maximum_Long_Range_Level FROM Role;
-- Output:
-- Maximum_Long_Range_Level
-- 10

-- Query 457
SELECT MIN(Long_Range_Level) AS Minimum_Long_Range_Level FROM Role;
-- Output:
-- Minimum_Long_Range_Level
-- 5

-- Query 458
SELECT Long_Range_Level FROM Role WHERE Long_Range_Level > 0 ORDER BY Long_Range_Level;
-- Output:
-- Long_Range_Level
-- 5
-- 5
-- 6
-- 10

-- Query 459
SELECT SUM(Close_Range_Level) AS Total_Close_Range_Level FROM Role;
-- Output:
-- Total_Close_Range_Level
-- 22

-- Query 460
SELECT AVG(Close_Range_Level) AS Average_Close_Range_Level FROM Role;
-- Output:
-- Average_Close_Range_Level
-- 5.5

-- Query 461
SELECT MAX(Close_Range_Level) AS Maximum_Close_Range_Level FROM Role;
-- Output:
-- Maximum_Close_Range_Level
-- 10

-- Query 462
SELECT MIN(Close_Range_Level) AS Minimum_Close_Range_Level FROM Role;
-- Output:
-- Minimum_Close_Range_Level
-- 3

-- Query 463
SELECT Close_Range_Level FROM Role WHERE Close_Range_Level > 0 ORDER BY Close_Range_Level;
-- Output:
-- Close_Range_Level
-- 3
-- 4
-- 5
-- 10

-- Query 464
SELECT SUM(Required_Per_Team) AS Total_Required_Per_Team FROM Role;
-- Output:
-- Total_Required_Per_Team
-- 4

-- Query 465
SELECT AVG(Required_Per_Team) AS Average_Required_Per_Team FROM Role;
-- Output:
-- Average_Required_Per_Team
-- 1

-- Query 466
SELECT MAX(Required_Per_Team) AS Maximum_Required_Per_Team FROM Role;
-- Output:
-- Maximum_Required_Per_Team
-- 1

-- Query 467
SELECT MIN(Required_Per_Team) AS Minimum_Required_Per_Team FROM Role;
-- Output:
-- Minimum_Required_Per_Team
-- 1

-- Query 468
SELECT Required_Per_Team FROM Role WHERE Required_Per_Team > 0 ORDER BY Required_Per_Team;
-- Output:
-- Required_Per_Team
-- 1
-- 1
-- 1
-- 1

-- Query 469
SELECT SUM(Minimum_Kills) AS Total_Minimum_Kills FROM Role;
-- Output:
-- Total_Minimum_Kills
-- 6

-- Query 470
SELECT AVG(Minimum_Kills) AS Average_Minimum_Kills FROM Role;
-- Output:
-- Average_Minimum_Kills
-- 1.5

-- Query 471
SELECT MAX(Minimum_Kills) AS Maximum_Minimum_Kills FROM Role;
-- Output:
-- Maximum_Minimum_Kills
-- 2

-- Query 472
SELECT MIN(Minimum_Kills) AS Minimum_Minimum_Kills FROM Role;
-- Output:
-- Minimum_Minimum_Kills
-- 1

-- Query 473
SELECT Minimum_Kills FROM Role WHERE Minimum_Kills > 0 ORDER BY Minimum_Kills;
-- Output:
-- Minimum_Kills
-- 1
-- 1
-- 2
-- 2

-- Query 474
SELECT SUM(Tournament_ID) AS Total_Tournament_ID FROM Tournament;
-- Output:
-- Total_Tournament_ID
-- 55

-- Query 475
SELECT AVG(Tournament_ID) AS Average_Tournament_ID FROM Tournament;
-- Output:
-- Average_Tournament_ID
-- 5.5

-- Query 476
SELECT MAX(Tournament_ID) AS Maximum_Tournament_ID FROM Tournament;
-- Output:
-- Maximum_Tournament_ID
-- 10

-- Query 477
SELECT MIN(Tournament_ID) AS Minimum_Tournament_ID FROM Tournament;
-- Output:
-- Minimum_Tournament_ID
-- 1

-- Query 478
SELECT Tournament_ID FROM Tournament WHERE Tournament_ID > 0 ORDER BY Tournament_ID;
-- Output:
-- Tournament_ID
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10

-- Query 479
SELECT SUM(Prize_Pool) AS Total_Prize_Pool FROM Tournament;
-- Output:
-- Total_Prize_Pool
-- 100000

-- Query 480
SELECT AVG(Prize_Pool) AS Average_Prize_Pool FROM Tournament;
-- Output:
-- Average_Prize_Pool
-- 10000

-- Query 481
SELECT MAX(Prize_Pool) AS Maximum_Prize_Pool FROM Tournament;
-- Output:
-- Maximum_Prize_Pool
-- 10000

-- Query 482
SELECT MIN(Prize_Pool) AS Minimum_Prize_Pool FROM Tournament;
-- Output:
-- Minimum_Prize_Pool
-- 10000

-- Query 483
SELECT Prize_Pool FROM Tournament WHERE Prize_Pool > 0 ORDER BY Prize_Pool;
-- Output:
-- Prize_Pool
-- 10000
-- 10000
-- 10000
-- 10000
-- 10000
-- 10000
-- 10000
-- 10000
-- 10000
-- 10000

-- Query 484
SELECT SUM(Max_Teams) AS Total_Max_Teams FROM Tournament;
-- Output:
-- Total_Max_Teams
-- 120

-- Query 485
SELECT AVG(Max_Teams) AS Average_Max_Teams FROM Tournament;
-- Output:
-- Average_Max_Teams
-- 12

-- Query 486
SELECT MAX(Max_Teams) AS Maximum_Max_Teams FROM Tournament;
-- Output:
-- Maximum_Max_Teams
-- 12

-- Query 487
SELECT MIN(Max_Teams) AS Minimum_Max_Teams FROM Tournament;
-- Output:
-- Minimum_Max_Teams
-- 12

-- Query 488
SELECT Max_Teams FROM Tournament WHERE Max_Teams > 0 ORDER BY Max_Teams;
-- Output:
-- Max_Teams
-- 12
-- 12
-- 12
-- 12
-- 12
-- 12
-- 12
-- 12
-- 12
-- 12

-- Query 489
SELECT SUM(Total_Matches) AS Total_Total_Matches FROM Tournament;
-- Output:
-- Total_Total_Matches
-- 100

-- Query 490
SELECT AVG(Total_Matches) AS Average_Total_Matches FROM Tournament;
-- Output:
-- Average_Total_Matches
-- 10

-- Query 491
SELECT MAX(Total_Matches) AS Maximum_Total_Matches FROM Tournament;
-- Output:
-- Maximum_Total_Matches
-- 10

-- Query 492
SELECT MIN(Total_Matches) AS Minimum_Total_Matches FROM Tournament;
-- Output:
-- Minimum_Total_Matches
-- 10

-- Query 493
SELECT Total_Matches FROM Tournament WHERE Total_Matches > 0 ORDER BY Total_Matches;
-- Output:
-- Total_Matches
-- 10
-- 10
-- 10
-- 10
-- 10
-- 10
-- 10
-- 10
-- 10
-- 10

-- Query 494
SELECT SUM(Organizer_ID) AS Total_Organizer_ID FROM Tournament;
-- Output:
-- Total_Organizer_ID
-- 30

-- Query 495
SELECT AVG(Organizer_ID) AS Average_Organizer_ID FROM Tournament;
-- Output:
-- Average_Organizer_ID
-- 3

-- Query 496
SELECT MAX(Organizer_ID) AS Maximum_Organizer_ID FROM Tournament;
-- Output:
-- Maximum_Organizer_ID
-- 5

-- Query 497
SELECT MIN(Organizer_ID) AS Minimum_Organizer_ID FROM Tournament;
-- Output:
-- Minimum_Organizer_ID
-- 1

-- Query 498
SELECT Organizer_ID FROM Tournament WHERE Organizer_ID > 0 ORDER BY Organizer_ID;
-- Output:
-- Organizer_ID
-- 1
-- 1
-- 2
-- 2
-- 3
-- 3
-- 4
-- 4
-- 5
-- 5

-- Query 499
SELECT SUM(Sponsor_ID) AS Total_Sponsor_ID FROM Tournament;
-- Output:
-- Total_Sponsor_ID
-- 30

-- Query 500
SELECT AVG(Sponsor_ID) AS Average_Sponsor_ID FROM Tournament;
-- Output:
-- Average_Sponsor_ID
-- 3
