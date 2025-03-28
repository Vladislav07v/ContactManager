CREATE DATABASE ContactManager
USE ContactManager
DROP DATABASE ContactManager

CREATE TABLE Person(
		person_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL ,
		first_name NVARCHAR(50) NOT NULL,
		second_name NVARCHAR(50) NULL,
		[address] NVARCHAR(150) NULL,
		birth_date DATE NULL
)
CREATE TABLE Contact(
		contact_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL ,
		phone_num BIGINT UNIQUE NOT NULL ,
		email NVARCHAR(50) UNIQUE NULL,
		person_id INT FOREIGN KEY REFERENCES Person(person_id) NOT NULL,
		creation_date DATE NOT NULL
)
CREATE TABLE Tags(
		tag_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL ,
		[name] NVARCHAR(50) NOT NULL
)
CREATE TABLE Contact_Tags(
		contact_id INT FOREIGN KEY REFERENCES Contact(contact_id) NOT NULL,
		tag_id INT FOREIGN KEY REFERENCES Tags(tag_id) NOT NULL,
		PRIMARY KEY (contact_id, tag_id)
)
INSERT INTO Person(first_name, second_name, [address], birth_date) VALUES
		('John', 'Doe', '123 Main St, Springfield', '1985-06-15'),
	    ('Jane', 'Smith', '456 Elm St, Riverside', '1990-09-22'),
        ('Alice', 'Johnson', '789 Oak St, Centerville', '1978-12-05'),
        ('Bob', 'Brown', '101 Maple Ave, Brookfield', '2000-03-10'),
        ('Charlie', 'Davis', '202 Pine Rd, Westwood', '1995-08-30');
INSERT INTO Contact(person_id, phone_num, email,creation_date) VALUES
		(1, 5551234, 'john.doe@example.com', '2005-06-15'),
	    (2, 5555678, 'jane.smith@example.com', '2010-09-22'),
		(3, 5558765, 'alice.johnson@example.com', '2015-12-05'),
		(4, 5554321, 'bob.brown@example.com', '2020-03-10'),
		(5, 5556789, 'charlie.davis@example.com', '2022-08-30');
INSERT INTO Tags([name]) VALUES
		('Work'),
		('School'),
		('Gym')

INSERT INTO Contact_Tags(contact_id, tag_id) VALUES
    (1, 1), 
    (1, 2),  
    (2, 2),  
    (3, 1),  
    (4, 2), 
    (4, 1), 
    (5, 1)

SELECT * FROM Person
SELECT * FROM Contact
SELECT * FROM Tags
SELECT * FROM Contact_Tags