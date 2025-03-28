CREATE DATABASE ContactManager
USE ContactManager

CREATE TABLE PersonInfo(
		person_Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL ,
		first_Name NVARCHAR(50) NOT NULL,
		second_Name NVARCHAR(50),
		[address] NVARCHAR(150) 
)
CREATE TABLE Contact(
		contact_Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL ,
		phone_Num BIGINT NOT NULL UNIQUE,
		email NVARCHAR(50) UNIQUE,
		person_id INT FOREIGN KEY REFERENCES PersonInfo(person_id),
		creation_Date DATE
)
CREATE TABLE Tags(
		tag_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL ,
		[name] NVARCHAR(50)
)
CREATE TABLE ConInfo_Tags(
		contact_id INT FOREIGN KEY REFERENCES Contact(contact_id) NOT NULL,
		tag_id INT FOREIGN KEY REFERENCES Tags(tag_id) NOT NULL,
		PRIMARY KEY (contact_id, tag_id)
)

INSERT INTO PersonInfo(first_Name, second_Name, [address]) VALUES
		('Jo', 'Gsda', 'awdafwaa3131'),
		('Ben', 'AFaw', 'dadawdwa agseafa'),
		('Obama', 'JTrump', 'asdasgjaifwa'),
		('Danny', 'Banana', 'daghjhtesbgs'),
		('Mitko', 'Boos', 'htgsgsbw')
INSERT INTO Contact(phone_num, email, person_id, creation_Date) VALUES
		(123232421, 'JOhn@Goi.Com', 1, '2002-01-08'),
		(342141414, 'Daww@Cada.Com', 3, '2001-03-23'),
		(424253533, 'Camsa@fga.Com', 5, '2002-04-20'),
		(454325255, 'FAWa@dadaawd.Com', 4, '2002-05-28'),
		(243535552, 'Cabas@dad.Com', 2, '2002-07-18')
INSERT INTO Tags([name]) VALUES
		('work'),
		('school')

INSERT INTO ConInfo_Tags(contact_id,tag_id) VALUES
        (1,2),
        (2,2),
        (1,1),
        (3,1),
        (4,2),
        (4,1),
        (5,1)


SELECT *
FROM PersonInfo
SELECT *
FROM Contact
SELECT *
FROM Tags
SELECT *
FROM ConInfo_Tags