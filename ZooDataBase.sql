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

SELECT persons_fname AS 'First Name', persons_lname AS 'Last Name', persons_contact AS 'Phone:' FROM tbl_persons WHERE persons_fname LIKE 's%' ORDER BY persons_lname;

DROP TABLE tbl_class;

CREATE TABLE tbl_class (	class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),	class_type VARCHAR(50) NOT NULL);INSERT INTO tbl_class		(class_type)		VALUES 		('bird'),		('reptilian'),		('mammal'),		('arthropod'),		('fish'),		('worm'),		('cnidaria'),		('echinoderm')	;
	SELECT REPLACE(class_type, 'bird', 'birds') FROM tbl_class;
SELECT COUNT(class_type) FROM tbl_class WHERE class_type = 'bird';
	SELECT * FROM tbl_class;	CREATE TABLE tbl_order (	order_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),	order_type VARCHAR (50) NOT NULL	);	CREATE TABLE tble_care (	care_id VARCHAR (50) PRIMARY KEY NOT NULL,		care_type VARCHAR (50) NOT NULL,		care_specialist INT NOT NULL	);		CREATE TABLE tble_nutrition ( 	 nutrition_id INT PRIMARY KEY NOT NULL IDENTITY (2200,1),		 nutrition_type VARCHAR (50) NOT NULL,		 nutrition_cost MONEY NOT NULL	);		CREATE TABLE tble_habitat ( 	 habitat_id INT PRIMARY KEY NOT NULL IDENTITY (5000,1),		habitat_type VARCHAR (50) NOT NULL,		 habitat_cost MONEY NOT NULL );	CREATE TABLE tble_specialist ( 	specialist_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),		specialist_fname VARCHAR (50) NOT NULL,		specialist_lname VARCHAR (50) NOT NULL,		specialist_contact VARCHAR (50) NOT NULL,);INSERT INTO tbl_order		(order_type)		VALUES 		('omnivore'),		('herbivore'),		('carnivorel')	;  	SELECT * FROM tbl_order;	INSERT INTO tble_care		(care_id, care_type, care_specialist)		VALUES 		('care_0', 'replace the straw', 1),		('care_1', 'repair broken toys', 4),	('care_2', 'bottle vitamins', 1),	('care_3', 'pet animals', 2),	('care_4', 'cean poo', 1),	('care_5', 'walk animals', 3),	('care_6', 'replace water', 1),	('care_7', 'dental care', 3)	;  	SELECT * FROM tbl_order;