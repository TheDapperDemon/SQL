USE db_zoo;

CREATE TABLE tbl_animalia (
	animals_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	animals_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_animalia
	(animals_type)
	VALUES
	('vertebrate'),
	('invertebrate')
;

SELECT * FROM tbl_animalia;

CREATE TABLE tbl_class (
	class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	class_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_class
	(class_type)
	VALUES
	('bird'),
	('fish'),
	('worm'),
	('arthropod'),
	('mammal'),
	('reptile')
;
SELECT * FROM tbl_class;

SELECT REPLACE(class_type, 'bird', 'birds') FROM tbl_class;
SELECT COUNT(class_type) FROM tbl_class WHERE class_type = 'bird';

CREATE TABLE tbl_persons (
	persons_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	persons_fname VARCHAR(50) NOT NULL,
	persons_lname VARCHAR(50) NOT NULL,
	persons_contact VARCHAR(50) NOT NULL
);

INSERT INTO tbl_persons
	(persons_fname, persons_lname,persons_contact)
	VALUES
	('bob', 'smith', '232-345-5768'),
	('jim', 'smoth', '232-345-5768'),
	('bib', 'smih', '232-345-5768'),
	('bb', 'mith', '232-345-5768')
;

SELECT persons_fname, persons_lname,persons_contact FROM tbl_persons WHERE persons_lname LIKE 'sm%';