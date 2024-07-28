CREATE DATABASE useranddevice;

DROP DATABASE useranddevice;

USE useranddevice;

-- Create the user table
CREATE TABLE user (
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Graduation_Year INT,
    PID INT NOT NULL,
    PID_Type VARCHAR(10) NOT NULL,
    PRIMARY KEY (PID, PID_Type)
);

-- Create Device Table
CREATE TABLE devices (
    Mac_Address VARCHAR(20) NOT NULL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Type VARCHAR(50) NOT NULL,
    User_PID INT NOT NULL,
    User_PID_Type VARCHAR(10) NOT NULL,
    FOREIGN KEY (User_PID, User_PID_Type) REFERENCES user(PID, PID_Type) ON DELETE CASCADE
);

-- Add Users
INSERT INTO user (Name, Age, Graduation_Year, PID, PID_Type) VALUES 
('zeyad',21,2025,102,'Pass'),
('Ahmed', 10, NULL, 100, 'NIP'),
('Ali', 20, 2026, 101, 'NIP'),
('Sam', 30, 2016, 100, 'Pass');
SELECT * FROM user;

INSERT INTO user (Name, Age, Graduation_Year, PID, PID_Type) VALUES 
('zeyad',21,2025,102,'Pass');

-- Add Devices
INSERT INTO Devices (Mac_Address, Name, Type, User_PID, User_PID_Type) VALUES 
('123.456.789', 'phone', 'Samsung', 100, 'NIP'),
('987.654.321', 'laptop', 'Samsung', 101, 'NIP'),
('987.654.322', 'laptop', 'Samsung', 101, 'NIP');
SELECT * FROM Devices;

INSERT INTO Devices (Mac_Address, Name, Type, User_PID, User_PID_Type) VALUES 
('123.456.744', 'phone', 'Samsung', 102, 'Pass');

-- get users
SELECT * FROM user;

-- get devices
SELECT * FROM Devices;

-- Retrieve a specific user
SELECT * FROM user WHERE PID = 102 AND PID_Type = 'Pass';

-- get number of Devices
SELECT u.*, COUNT(d.Mac_Address) 
FROM user u
JOIN Devices d ON u.PID = d.User_PID AND u.PID_Type = d.User_PID_Type
WHERE u.PID = 101 AND u.PID_Type = 'NIP'
GROUP BY u.PID, u.PID_Type;

-- Delete a single user
DELETE FROM user WHERE PID = 100 AND PID_Type = 'NIP';
SELECT * FROM user;

-- Delete a single device
DELETE FROM Devices WHERE Mac_Address = '987.654.322';
SELECT * FROM Devices;

-- Delete all users with samsung 
DELETE u
FROM user u
JOIN Devices d ON u.PID_Type = d.User_PID_Type
WHERE d.Type = 'Samsung';
SELECT * FROM Devices;
