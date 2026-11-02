CREATE database panduRestaruant
USE panduRestaruant
CREATE TABLE Restaruant (
    RID INT PRIMARY KEY,
    Rname VARCHAR(40) NOT NULL,
    Address VARCHAR(40) NOT NULL,
    Contact VARCHAR(15) NOT NULL,
    Rating INT CHECK (Rating > 0 AND Rating < 6),
    Type VARCHAR(40)
);

INSERT INTO Restaruant VALUES
(101, 'Manjunadha Bhavan', 'Tirupathi', '95906', 4, 'Veg & Non Veg'),
(109, 'Tejas Kitchen', 'Kotapadu', '99596', 3, 'Veg Meals'),
(121, 'Ammamma Gari Hotel', 'Hyd', '93983', 5, 'Veg & Non Veg'),
(129, 'Taj Tiffins', 'Kakinada', '63054', 5, 'Veg'),
(135, 'Tulip Hotel', 'Chennai', '99631', 4, 'Veg & Non Veg');

CREATE TABLE Customer (
    CID INT PRIMARY KEY,
    Mobile VARCHAR(15) NOT NULL,
    Email VARCHAR(40) NOT NULL,
    Address VARCHAR(40),
    Name VARCHAR(40) NOT NULL
);

INSERT INTO Customer VALUES
(18, '97721', 'lalubhai18@gmail.com', 'Ongole', 'LALU PRASAD'),
(110, '99592', 'teja9913@gmail.com', 'Eluru', 'TEJA'),
(112, '75677', 'sasi776@gmail.com', 'Bhimavaram', 'SASI'),
(180, '96777', 'lakshman53@gmail.com', 'Vijayawada', 'LAKSHMAN'),
(230, '96787', 'anvith73@gmail.com', 'Vizag', 'ANVITH'),
(178, '95206', 'lokesh34@gmail.com', 'Tirupathi', 'LOKESH'),
(510, '78977', 'yogoreddy8@gmail.com', 'Bang', 'YOGIREDDY'),
(114, '99501', 'munna19@gmail.com', 'Kadapa', 'MUNNA'),
(761, '93062', 'vijay22@gmail.com', 'Guntur', 'VIJAY'),
(150, '95251', 'likhith4@gmail.com', 'Kakinada', 'LIKHITH');

CREATE TABLE Payment (
    PID INT PRIMARY KEY,
    Amount INT NOT NULL,
    PaymentType VARCHAR(40) NOT NULL,
    PaymentDate DATE NOT NULL,
    Discount INT
);

INSERT INTO Payment VALUES
(5200, 2000, 'CASH', '2025-04-12', 9),
(5210, 1590, 'UPI', '2025-08-17', 35),
(5225, 2100, 'CASH', '2025-09-02', 59),
(5233, 2631, 'CASH', '2025-08-12', 32),
(5239, 5096, 'UPI', '2026-04-22', 14),
(5259, 1079, 'CASH', '2025-11-16', 45),
(5270, 3332, 'UPI', '2026-12-12', 28),
(5295, 2592, 'CASH', '2025-10-12', 33),
(5309, 2129, 'UPI', '2024-06-18', 15),
(5377, 2263, 'CASH', '2027-04-25', 35);

CREATE TABLE Food (
    FID INT PRIMARY KEY,
    Fname VARCHAR(40) NOT NULL,
    FoodType VARCHAR(40) NOT NULL,
    Qty INT,
    Price INT NOT NULL
);

INSERT INTO Food VALUES
(1, 'DOSA', 'Veg', 5, 300),
(2, 'MAGGI', 'Veg', 1, 40),
(3, 'Chicken Curry', 'Non Veg', 1, 120),
(4, 'IDLY', 'Veg', 5, 60),
(5, 'ROTI', 'Veg', 1, 30),
(6, 'Veg Biryani', 'Veg', 1, 110),
(7, 'Chicken Biryani', 'Non Veg', 3, 450),
(8, 'VADA', 'Veg', 3, 40),
(9, 'Chapathi', 'Veg', 2, 50),
(10, 'Fried Gobi', 'Veg', 1, 60);

CREATE TABLE Staff (
    SID INT PRIMARY KEY,
    Sname VARCHAR(40) NOT NULL,
    Orders INT,
    Rating INT CHECK (Rating > 0 AND Rating < 6),
    Salary INT
);

INSERT INTO Staff VALUES
(101, 'RAGHASVA', 5, 4, 22000),
(102, 'ABDUL', 8, 3, 33000),
(103, 'VERA', 5, 5, 43000),
(104, 'RAVAN', 6, 5, 27000),
(105, 'VARUN', 7, 4, 34000);

SELECT * FROM Restaruant;
SELECT * FROM Customer;
SELECT * FROM Payment;
SELECT * FROM Food;
SELECT * FROM Staff;

UPDATE Restaruant
SET Address = 'Rangampet'
WHERE RID = 101;

UPDATE Restaruant
SET Rating = 4
WHERE Rname = 'Taj Tiffins';

UPDATE Customer
SET Email = 'tejateju07@gmail.com',
    Address = 'Eluru'
WHERE CID = 110
AND Name = 'TEJA';

UPDATE Payment
SET Discount = 15
WHERE PID = 5200;

UPDATE Food
SET FoodType = 'Fast Food'
WHERE Fname = 'MAGGI';

UPDATE Food
SET Qty = 5
WHERE FID = 2;

UPDATE Restaruant
SET Type = 'Non Veg'
WHERE RID = 129;

UPDATE Staff
SET Salary = 29000
WHERE Rating = 5
AND Orders = 5;

SELECT Contact
FROM Restaruant
WHERE RID = 101;

SELECT *
FROM Restaruant
WHERE Rating = 4
AND Address = 'Rangampet';

SELECT Email
FROM Customer
WHERE CID = 110;

SELECT Price, Qty
FROM Food;

SELECT Fname
FROM Food
WHERE FoodType = 'Fast Food'
AND Price < 100;

SELECT PaymentType
FROM Payment
WHERE PID = 5200;

ALTER TABLE Staff
ADD DateOfJoining DATE;

UPDATE Staff
SET DateOfJoining = '2024-01-15'
WHERE SID = 101;

UPDATE Staff
SET DateOfJoining = '2024-02-10'                     
WHERE SID = 102;
                                                             
UPDATE Staff
SET DateOfJoining = '2023-11-20'
WHERE SID = 103;

UPDATE Staff
SET DateOfJoining = '2024-03-05'
WHERE SID = 104;

UPDATE Staff
SET DateOfJoining = '2023-08-12'
WHERE SID = 105;

DELETE FROM Payment
WHERE PID = 5377
AND PaymentType = 'CASH';

DELETE FROM Food
WHERE Fname = 'Fried Gobi';

DELETE FROM Staff
WHERE Rating < 3
OR Orders < 5;

SELECT * FROM Restaruant;
SELECT * FROM Customer;
SELECT * FROM Payment;
SELECT * FROM Food;
SELECT * FROM Staff;