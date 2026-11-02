create database BookMyShow
use BookMyShow
create table Customer(
CID int    PRIMARY KEY,
Cname Varchar(30) not null,
Mobile int not null,
emial varchar(20) not null,
city varchar(10) not null
) 
insert into Customer values
 (101,'Barath',967847,'barath04@gmail.com','TPT'),
 (102,'Kalyan',967657,'kalyan04@gmail.com','HYD'),
 (103,'Sham',887847,'sham18@gmail.com','KRNl'),
 (104,'Vikas',867847,'vikas4@gmail.com','Vizag'),
 (105,'Balu',968697,'balu9@gmail.com','ADN'),
 (106,'Narshima',967847,'nara5@gmail.com','KADAPA'),
 (107,'kiran',967847,'kiran0@gmail.com','KRNL'),
 (108,'Raju',767847,'raju09@gmail.com','BANG'),
 (109,'Anjali',967647,'anju05@gmail.com','CHENNAI'),
 (110,'sreesai',967687,'sai140@gmail.com','ATP'),
 (111,'prakash',967847,'prakash20@gmail.com','KADAPA'),
 (112,' jagadish',907847,'jaggu4@gmail.com','KRNL'),
 (113,'keshav',967847,'keshav0@gmail.com','ADN'),
 (114,'Allu arjun',786947,'allu08@gmail.com','HYD'),
 (115,'prasad',967847,'prasad110@gmail.com','NDYL');
 
create table Movie(
 MID int primary key,
 Mname varchar(30) not null,
 Language varchar(30) not null,
 gener varchar(20) not null,
 Duration int not null
 )
 insert into Movie values
  (201,'kiladi','Telugu','Action And Comdey',158),
  (202,'PUSHPA','Telugu','Action',170),
  (203,'OG','Telugu','Action And Thiller',153),
  (204,'pokiri','Telugu','Action And Comdey',140),
  (205,'KGF','Kanada','Action And Thiller',170),
  (206,'LEO','Tamil','Action And thiller',157),
  (207,'Three','Tamil','Emotional',146),
  (208,'Kantara','Telugu and Kanada','Action and Drama',148),
  (209,'3 Idiots','Hindi','Comedy and Drama',170),
  (210,'Dabgal','Hindi','Sport and Drana',161),
  (211,'Vikram','Telugu and Tamil','Action and Thriller',174),
  (212,'Premam','Malayalam','Romance AND Drama',158),
  (213,'Sairat','Malyalam','Romance AND Drama',174),
  (214,'Lucai','Kannada','Mystery And Thriller',135),
  (215,'777 Charlie','Kannada','Adventure/Drama',164);
 create table Theater (
 TID int primary key,
 Tname Varchar(30) not null,
 TLocation varchar(25) not null,
 city varchar(20) not null,
 Screens int not null
 ) 
 insert into Theater values
(301,'Sri Lakshmi Cinemas','Main Road','Vijayawada',4),
(302,'PGR Cinemas','Near bus stop','Tirupathi',2),
(303,'INOX Multiplex','MG Road','Bengaluru',5),
(304,'Asian Cinemas','Kukatpally','Hyderabad',7),
(305,'Cinepolis','Hitech City','Hyderabad',8),
(306,'Prasads Multiplex','Necklace Road','Hyderabad',5),
(307,'Sathyam Cinemas','Royapettah','Chennai',6),
(308,'AGS Cinemas','T. Nagar','Chennai',4),
(309,'Lulu Mall Cinemas','Edappally','Kochi',9),
(310,'PVR Forum Mall','Koramangala','Bengaluru',7),
(311,'Miraj Cinemas','Andheri','Mumbai',5),
(312,'Carnival Cinemas','Andheri West','Mumbai',6),
(313,'Rajhans Cinemas','Paldi','Ahmedabad',4),
(314,'City Pride Cinemas','Kothrud','Pune',6),
(315,'INOX Central Mall','Salt Lake','Kolkata',5);
 create table Show(
 SID int primary key  ,
 M_ID int,
 T_ID int,
 show_date Date not null,
 Time time not null,
 foreign key(M_id) references Movie(MID),
 foreign key(T_id) references Theater(TID)
 )
 insert into Show values
(401,201,301,'2026-09-01','10:00:00'),
(402,202,302,'2026-09-01','13:30:00'),
(403,203,303,'2026-09-01','18:00:00'),
(404,204,304,'2026-09-02','10:30:00'),
(405,205,305,'2026-09-02','14:00:00'),
(406,206,306,'2026-09-02','18:30:00'),
(407,207,307,'2026-09-03','11:00:00'),
(408,208,308,'2026-09-03','15:00:00'),
(409,209,309,'2026-09-03','19:00:00'),
(410,210,310,'2026-09-04','10:00:00'),
(411,211,311,'2026-09-04','13:00:00'),
(412,212,312,'2026-09-04','17:30:00'),
(413,213,313,'2026-09-05','11:30:00'),
(414,214,314,'2026-09-05','15:30:00'),
(415,215,315,'2026-09-05','19:30:00');
 create table Booking(
 BID int primary key,
 C_ID int,
 S_ID int,
 seats varchar(5) not null,
 Date date not null,
 foreign key(C_ID) references Customer(CID),
 foreign key(S_ID) references Show(SID)
 )
 insert into Booking values
(501,101,401,'A1','2026-08-26'),
(502,102,402,'A2','2026-08-26'),
(503,103,403,'B1','2026-08-26'),
(504,104,404,'B2','2026-08-26'),
(505,105,405,'C1','2026-08-26'),
(506,106,406,'C2','2026-08-26'),
(507,107,407,'D1','2026-08-26'),
(508,108,408,'D2','2026-08-26'),
(509,109,409,'E1','2026-08-26'),
(510,110,410,'E2','2026-08-26'),
(511,111,411,'F1','2026-08-26'),
(512,112,412,'F2','2026-08-26'),
(513,113,413,'G1','2026-08-26'),
(514,114,414,'G2','2026-08-26'),
(515,115,415,'H1','2026-08-26');
 create table payment(
 PID int primary key,
 B_ID int ,
 Amount int not null,
 PType varchar(20),
 Pstatus varchar(20),
 foreign key(B_ID) references Booking(BID)
 )

insert into payment values
(601,501,250,'Cash','Successful'),
(602,502,300,'UPI','Successful'),
(603,503,450,'UPI','Successful'),
(604,504,350,'Cash','Successful'),
(605,505,500,'UPI','Successful'),
(606,506,400,'Cash','Pending'),
(607,507,300,'UPI','Successful'),
(608,508,550,'UPI','Successful'),
(609,509,250,'Cash','Successful'),
(610,510,600,'UPI','Successful'),
(611,511,450,'Cash','Pending'),
(612,512,350,'UPI','Successful'),
(613,513,500,'UPI','Successful'),
(614,514,300,'Cash','Successful'),
(615,515,650,'UPI','Successful');

SELECT * from Customer;
SELECT * from Movie;
SELECT * from Theater;
SELECT * from Show;
SELECT * from Booking;
SELECT * from  payment;
use  BookMyShow;

SELECT Cname from Customer
WHERE city = 'TPT';

SELECT Cname, Mobile from Customer
WHERE city = 'HYD';tr

SELECT * from Movie
WHERE Language = 'Telugu';

SELECT Mname, gener from Movie
WHERE gener= 'Action';

SELECT Mname from Movie
WHERE Duration > 150;

SELECT * from Theater
WHERE city = 'Tirupathi';

SELECT Tname, TLocation from Theater
WHERE Screens > 3;

SELECT * from Movie
WHERE Duration > 150;

SELECT SID, M_ID, Time from Show
WHERE Time > '18:00:00';

SELECT * FROM Booking
WHERE (seats) > 3;

SELECT BID, C_ID, seats from Booking
WHERE Date > '2026-08-26';

SELECT * from payment
WHERE Amount > 500;

SELECT PID, B_ID, PType from payment
WHERE PType = 'UPI';

SELECT * from payment
WHERE Pstatus = 'Successful';

SELECT Cname, email from Customer
WHERE city = 'TPT'
OR city = 'CHENNAI';

SELECT Mname from Movie
WHERE Language = 'Telugu'
AND gener = 'Action';

SELECT Mname from Movie
WHERE Duration > 120
AND Duration < 180;

SELECT * from Customer
WHERE city = 'TPT'
AND email='@gmail.com';

SELECT * from Theater
WHERE city = 'Tirupathi'
OR city = 'Hyderabad';

SELECT Tname from Theater
WHERE Screens > 2
AND city = 'Tirupathi';

SELECT * from Booking
WHERE seats >= 2
AND seats <= 5;

SELECT BID, C_ID from Booking
WHERE Date = '2026-08-26'
OR seats > 4;

SELECT * from payment
WHERE Amount > 500
AND Pstatus = 'Successful';

SELECT PID, Amount, PType from payment
WHERE PType IN ('UPI', 'Credit');

SELECT Cname from Customer
WHERE city IN ('TPT', 'HYD')
AND Mobile IS NOT NULL;

SELECT CID, Cname from Customer
WHERE city = 'TPT';

SELECT Mname, Language, gener from Movie
WHERE Duration > 120;

SELECT Tname, city, Screens from Theater
WHERE Screens > 3;

SELECT SID, M_ID, Time from Show
WHERE Time > '18:00:00';

SELECT PID, Amount, Pstatus from payment
WHERE Amount > 500;

SELECT Cname, BID from Customer
JOIN Booking
ON Customer.CID = Booking.C_ID;

SELECT Cname, Mobile, seats from Customer
JOIN Booking
ON Customer.CID = Booking.C_ID;

SELECT Mname, Show.Time from Movie
JOIN Show
ON Movie.MID = Show.M_ID;

SELECT Mname, Show.Time, Show.show_date from Movie
JOIN Show
ON Movie.MID = Show.M_ID;

SELECT Tname, Show.Time from Theater
JOIN Show
ON Theater.TID = Show.T_ID;

SELECT Tname, city, Show.show_date from Theater
JOIN Show
ON Theater.TID = Show.T_ID;

SELECT Mname, Theater.Tname from Movie
JOIN Show
ON Movie.MID = Show.M_ID
JOIN Theater
ON Show.T_ID = Theater.TID;

SELECT Mname, Theater.Tname, Theater.city from Movie
JOIN Show
ON Movie.MID = Show.M_ID
JOIN Theater
ON Show.T_ID = Theater.TID
WHERE Theater.city = 'Tirupathi';

SELECT Cname, Movie.Mname, Booking.seats from Customer
JOIN Booking
ON Customer.CID = Booking.C_ID
JOIN Show
ON Booking.S_ID = Show.SID
JOIN Movie
ON Show.M_ID = Movie.MID


SELECT Mname, Theater.Tname, Show.Time from Movie
JOIN Show
ON Movie.MID = Show.M_ID
JOIN Theater
ON Show.T_ID = Theater.TID
WHERE Theater.city = 'Tirupathi'
AND Show.Time > '18:00:00';

SELECT Cname, Movie.Mname, Booking.Date from Customer
JOIN Booking
ON Customer.CID = Booking.C_ID
JOIN Show
ON Booking.S_ID = Show.SID
JOIN Movie
ON Show.M_ID = Movie.MID
WHERE Booking.Date > '2026-08-25';

SELECT .Mname, Theater.Tname, Theater.city from Movie
JOIN Show
ON Movie.MID = Show.M_ID
JOIN Theater
ON Show.T_ID = Theater.TID
WHERE Movie.Language = 'Telugu'
AND Theater.city = 'Tirupathi';

update Customer
SET city = 'Chittoor'
WHERE CID = 101;

update Movie
SET gener = 'Action'
WHERE MID = 201;

update Theater
SET Screens = Screens + 1
WHERE TID = 302;

update payment
SET Pstatus = 'Successful'
WHERE PID = 606;

update payment
SET PType = 'UPI'
WHERE Pstatus = 'Pending'
AND Amount < 500;

delete from Customer
WHERE CID = 101;

delete from Movie
WHERE Duration < 90;

delete from Theater
WHERE Screens < 3
AND city = 'Tirupathi';

delete from  Booking
WHERE seats=1
AND Date < '<date>';

delete from  payment
WHERE Pstatus = 'Failed'
AND Amount < 300;

update Movie
SET Duration = Duration + 10
WHERE Duration < 120;

update Theater
SET Screens = Screens + 1
WHERE Screens < 3;

update Theater
SET city = 'Tirupathi'
WHERE city = 'Chittoor'
AND Screens >= 3;

update Movie
SET Language = 'Telugu'
WHERE Language = 'English'
AND gener = 'Drama';

update Movie
SET gener = 'Action'
WHERE Language = 'Telugu'
AND Duration > 120;

update Show
SET Time = '18:00:00'
WHERE show_date = '2026-09-01'
AND Time < '18:00:00';

update Booking
set seats=seats+1
WHERE seats<3;

update Booking
SET Date = '<new_date>'
where seats>4
AND Booking.Date<'<specified_date>';

update payment
SET PType = 'UPI'
WHERE PType = 'Cash';

update payment
SET Pstatus = 'Successful'
WHERE Amount > 500
AND Pstatus = 'Pending';

update payment
SET Pstatus = 'Failed'
WHERE Amount < 100
AND Pstatus = 'Pending';

update payment
SET Amount = Amount + 50
WHERE PType = 'UPI'
AND Amount < 500;

delete from  Customer
WHERE city = 'TPT'
AND email = '@gmail.com';

delete from  Movie
WHERE Language = 'English'
AND Duration > 180;

delete from  Theater
WHERE city IN ('Hyderabad', 'Chennai')
AND Screens < 3;

delete from Show
WHERE show_date = '2026-09-01'
AND Time < '17:00:00';

delete from Booking
WHERE seats>4
AND Booking_Date<'<date>';

delete  payment
WHERE Amount > 1000
AND Pstatus = 'Failed';

SELECT COUNT(*) AS Customer_Count from Customer
WHERE city = 'TPT'
AND email = '@gmail.com';

SELECT COUNT(*) AS Customer_Count from Customer
WHERE city = 'HYD'
OR city = 'CHENNAI';

SELECT COUNT(*) AS Movie_Count from WHERE Language = 'Telugu'
AND gener = 'Action';

SELECT COUNT(*) AS Movie_Count from Movie
WHERE Duration > 120
AND Duration < 180;

SELECT COUNT(*) AS Theater_Count from Theater
WHERE city = 'Tirupathi'
AND Screens > 3;

SELECT COUNT(*) AS Booking_Count from Booking
where seats>=3
AND seats<=5;

SELECT MIN(Duration) AS Minimum_Duration from Movie
WHERE Language = 'Telugu'
AND gener = 'Action';

SELECT MAX(Duration) AS Maximum_Duration from Movie
WHERE Language IN ('English', 'Hindi');

SELECT AVG(Duration) AS Average_Duration from Movie
WHERE Duration > 120
AND Duration < 180;

SELECT MIN(Screens) AS Minimum_Screens from Theater
WHERE city = 'Tirupathi'
AND Screens > 2;

SELECT MAX(Screens) AS Maximum_Screens from Theater
WHERE city IN ('Hyderabad', 'Chennai');

SELECT AVG(Screens) AS Average_Screens from Theater
WHERE city = 'Tirupathi'
AND Screens >= 3;

SELECT MIN(seats) AS Minimum_Seats from Booking
WHERE seats>1
AND seats < 5;

SELECT MAX(seats) AS Maximum_Seats from Booking
WHERE Date > '<date>'
AND seats> 2;

SELECT AVG(Amount) AS Average_Payment from payment
WHERE Pstatus = 'Successful'
AND Amount > 500;

SELECT SUM(Amount) AS Total_Payment from payment
WHERE Pstatus = 'Successful'
AND Amount > 500;

SELECT SUM(Amount) AS Total_Payment from payment
WHERE PType = 'UPI'
AND Amount > 300;

SELECT SUM(Amount) AS Total_Payment from payment
WHERE Pstatus = 'Successful'
AND PType = 'UPI'
AND Amount > 500;

SELECT DISTINCT city from Theater
WHERE Screens > 2
AND Screens < 6;

SELECT DISTINCT Pstatus from payment
WHERE PType IN ('UPI', 'Credit');

SELECT DISTINCT show_date from Show
WHERE Time > '18:00:00'
AND Time < '22:00:00';

SELECT Cname from Customer
WHERE Cname LIKE 'A%'
AND city = 'TPT';

SELECT Cname from Customer
WHERE (Cname LIKE 'R%'
OR Cname LIKE 'S%')
AND city = 'HYD';

SELECT Cname, email from Customer
WHERE Cname LIKE '%a%'
AND email LIKE '%@gmail.com';

SELECT Mname from Movie
WHERE Mname LIKE 'S%'
AND Language = 'Telugu';

SELECT Language, AVG(Duration) AS Average_Duration from Movie
WHERE Duration > 100
GROUP BY Language;

SELECT city, COUNT(*) AS Theater_Count
from Theater
WHERE Screens >= 3
GROUP BY city;

SELECT city, AVG(Screens) AS Average_Screens from Theater
WHERE Screens > 2
GROUP BY city;

SELECT PType, SUM(Amount) AS Total_Amount from payment
WHERE Pstatus = 'Successful'
GROUP BY PType;

SELECT city, COUNT(*) AS Customer_Count from Customer
GROUP BY city
HAVING COUNT(*) > 2;

SELECT Language, COUNT(*) AS Movie_Count from Movie
GROUP BY Language
HAVING COUNT(*) > 3;

SELECT gener, AVG(Duration) AS Average_Duration from Movie
GROUP BY gener
HAVING AVG(Duration) > 120;

SELECT city, COUNT(*) AS Theater_Count from Theater
GROUP BY city
HAVING COUNT(*) >= 2;

SELECT PType, SUM(Amount) AS Total_Amount from payment
GROUP BY PType
HAVING SUM(Amount) > 2000;

SELECT gener, COUNT(*) AS Movie_Count from Movie
WHERE Language = 'Telugu'
GROUP BY gener
HAVING COUNT(*) > 2;

SELECT C_ID,SUM(seats) AS Total_Seats
from Booking
WHERE seats > 1
GROUP BY C_ID
HAVING SUM(seats) > 5;

SELECT PType, AVG(Amount) AS Average_Amount
from payment
WHERE Pstatus = 'Successful'
GROUP BY PType
HAVING AVG(Amount) > 500;

SELECT gener, COUNT(*) AS Movie_Count
from Movie
GROUP BY gener
ORDER BY Movie_Count DESC;

SELECT Language, AVG(Duration) AS Average_Duration
from Movie
GROUP BY Language
ORDER BY Average_Duration ;

SELECT PType, SUM(Amount) AS Total_Amount
from payment
WHERE Pstatus = 'Successful'
AND Amount > 300
GROUP BY PType
HAVING SUM(Amount) > 1000
ORDER BY Total_Amount DESC;

SELECT Mname from Movie
WHERE Duration=(SELECT MAX(Duration) from Movie )
//* vikram
    sairat*//
SELECT Mname from Movie
WHERE Duration=(SELECT MIN(Duration) from Movie )
//* Lucai*//

SELECT Tname  from Theater
WHERE Screens=(SELECT MAX(Screens) from Theater )
//* Lulu Mall Cinemas *//
SELECT Tname  from Theater
WHERE Screens=(SELECT MIN(Screens) from Theater )

SELECT * from Booking
WHERE Seats=(SELECT MAX(Seats) from Booking )

SELECT * from Booking
WHERE Seats=(SELECT MIN(Seats) from Booking )

SELECT * from payment
WHERE Amount=(SELECT MAX(Amount) from payment)


SELECT * from payment
WHERE Amount=(SELECT MIN(Amount) from payment)

SELECT Mname from Movie
WHERE Duration>(SELECT AVG(Duration) from Movie)

SELECT Tname from Theater
WHERE Screens>(SELECT AVG(Screens) from Theater)

SELECT * from Movie
WHERE Duration>(select Duration from Movie 
                 WHERE MID=205);
SELECT * from Theater
WHERE Screens>(SELECT Screens from Theater
                WHERE TID=102);
SELECT Cname from Customer
WHERE city = (SELECT city from Customer
                 WHERE CID = 105);
SELECT * from Booking
WHERE Seats>(SELECT Seats from  Booking 
              WHERE BID=305);
SELECT * from Payment
WHERE Amount>(SELECT Amount from Payment  
               WHERE PID=405);
SELECT Mname from movie
WHERE Duration<(SELECT AVG(Duration) from movie)

SELECT Tname from Theater
WHERE Screens<(SELECT AVG(Screens) from Theater)

SELECT Cname from Customer
WHERE CID IN (SELECT CID from Booking);

SELECT Mname from Movie
WHERE MID IN (SELECT MID from Show);

SELECT Tname from Theater
WHERE TID IN (SELECT TID from  Show);

SELECT Cname from Customer
WHERE CID NOT IN (SELECT C_ID from Booking);

SELECT Mname from Movie
WHERE Duration > (SELECT AVG(Duration)from  Movie)
AND Language = 'Telugu';

SELECT Tname from Theater
WHERE Screens > (SELECT AVG(Screens)from Theater)
AND city = 'Tirupathi';

SELECT *from payment
WHERE Amount > (SELECT AVG(Amount)from payment)
AND Pstatus = 'Successful';

SELECT Cname from Customer
WHERE CID IN (SELECT C_ID from Booking
    WHERE seats > 2);

SELECT Mname from Movie M
WHERE Duration > (SELECT AVG(Duration)from Movie
    WHERE Language = M.Language);

SELECT Tname from Theater T
WHERE Screens > (SELECT AVG(Screens) from Theater
    WHERE city = T.city);

SELECT C.*from Customer C
WHERE CID IN (SELECT B.C_ID from Booking B
    WHERE B.seats > (SELECT AVG(B1.seats)from Booking B1
        WHERE B1.C_ID = B.C_ID));

SELECT * from payment P
WHERE Amount > (SELECT AVG(P1.Amount)from payment P1
    WHERE P1.PType = P.PType);

SELECT Mname from Movie M
WHERE Duration > ( SELECT AVG(M1.Duration)from Movie M1
    WHERE M1.gener = M.gener);