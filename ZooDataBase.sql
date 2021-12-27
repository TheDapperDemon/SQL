USE db_zoo;

IF Exists (SELECT 1 FROM INFORMATION_SCHEMA.TABLES tble_species)
	DROP TABLE tble_species, tbl_animals, tble_care, tbl_class, tble_habitat, tble_nutrition, tbl_order, tble_specialist;

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

CREATE TABLE tbl_class (
	class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	class_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_class
		(class_type)
		VALUES 
		('bird'),
		('reptilian'),
		('mammal'),
		('arthropod'),
		('fish'),
		('worm'),
		('cnidaria'),
		('echinoderm')
	;
	SELECT REPLACE(class_type, 'bird', 'birds') FROM tbl_class;
SELECT COUNT(class_type) FROM tbl_class WHERE class_type = 'bird';


	SELECT * FROM tbl_class;

	CREATE TABLE tbl_order (
	order_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	order_type VARCHAR (50) NOT NULL
	);

	CREATE TABLE tble_care (
	care_id VARCHAR (50) PRIMARY KEY NOT NULL,
		care_type VARCHAR (50) NOT NULL,
		care_specialist INT NOT NULL
	);

		CREATE TABLE tble_nutrition ( 
	 nutrition_id INT PRIMARY KEY NOT NULL IDENTITY (2200,1),
		 nutrition_type VARCHAR (50) NOT NULL,
		 nutrition_cost MONEY NOT NULL
	);

		CREATE TABLE tble_habitat ( 
	 habitat_id INT PRIMARY KEY NOT NULL IDENTITY (5000,1),
		habitat_type VARCHAR (50) NOT NULL,
		 habitat_cost MONEY NOT NULL 
);

	CREATE TABLE tble_specialist ( 
	specialist_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		specialist_fname VARCHAR (50) NOT NULL,
		specialist_lname VARCHAR (50) NOT NULL,
		specialist_contact VARCHAR (50) NOT NULL,
);

INSERT INTO tbl_order
		(order_type)
		VALUES 
		('omnivore'),
		('herbivore'),
		('carnivorel')
	;  
	SELECT * FROM tbl_order;

	INSERT INTO tble_care
		(care_id, care_type, care_specialist)
		VALUES 
		('care_0', 'replace the straw', 1),
		('care_1', 'repair broken toys', 4),
	('care_2', 'bottle vitamins', 1),
	('care_3', 'pet animals', 2),
	('care_4', 'cean poo', 1),
	('care_5', 'walk animals', 3),
	('care_6', 'replace water', 1),
	('care_7', 'dental care', 3)
	;  
SELECT * FROM tble_care;

INSERT INTO tble_nutrition
	(nutrition_type, nutrition_cost)
	VALUES
	('raw fish',1500),
	('live rodents', 600),
	('fruit and rice mix',600),
	('warmed milk', 600),
	('stryinge feed broth', 600),
	('lard and seed mix', 300),
	('aphids', 150),
	('vitamins and marrow', 3500)
;
SELECT * FROM tble_nutrition;

INSERT INTO tble_habitat
	(habitat_type, habitat_cost)
	VALUES
	('tundra', 40000),
	('grassy gnoll and trees', 12000),
	('10ft pond with rocks', 30000),
	('Ice Aquarium with snow', 50000),
	('short grass with moat', 50000),
	('Nettled forest atrium', 10000),
	('Jungle vines with winding trees', 15000),
	('cliff with shaded cave', 15000)
;
SELECT * FROM tble_habitat;

INSERT INTO tble_specialist
	(specialist_fname, specialist_lname, specialist_contact)
	VALUES
	('margret', 'nyuden', '781-146-3589'),
	('mary', 'fisher', '781-146-3589'),
	('arnold', 'holden', '781-146-3589'),
	('ken', 'byesan', '781-146-3589'),
	('delmonte', 'fyedo', '359-146-3589')
;

SELECT * FROM tble_specialist;

CREATE TABLE tble_species (
species_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
species_name VARCHAR(50),
species_animalia INT NOT NULL CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES tbl_animalia(animals_id) ON UPDATE CASCADE ON DELETE CASCADE,
species_class INT NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_class(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
species_order INT NOT NULL CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tbl_order(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
species_habitat INT NOT NULL CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tble_habitat(habitat_id) ON UPDATE CASCADE ON DELETE CASCADE,
species_nutrition INT NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tble_nutrition(nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE,
species_care VARCHAR (50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tble_care(care_id) ON UPDATE CASCADE ON DELETE CASCADE
);


INSERT INTO tble_species
	(species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
	VALUES
	('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
	('jaguar', 1, 102, 1, 5007, 2200, 'care_4'),
	('penguin', 1, 100, 1, 5003, 2200, 'care_6'),
	('ghost bat', 1, 102, 1, 5007, 2204, 'care_2'),
	('chicken', 1, 100, 3, 5001, 2205, 'care_0'),
	('panda', 1, 102, 3, 5006, 2202, 'care_4'),
	('bobcat', 1, 102, 1, 5001, 2204, 'care_5'),
	('grey wolf', 1, 102, 1, 5000, 2201, 'care_4')
;

SELECT * FROM tble_species;

SELECT 
	a1.species_name, a2.animals_type, a3.class_type, a4.order_type, a5.habitat_type, a6.nutrition_type, a7.care_type
	FROM tble_species a1
	INNER JOIN tbl_animalia a2 ON a2.animals_id = a1.species_animalia
	INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
	INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
	INNER JOIN tble_habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN tble_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN tble_care a7 ON a7.care_id = a1.species_care
	WHERE species_name = 'brown bear'
;

SELECT 
	a1.species_name, a2.animals_type, a3.class_type, a4.order_type, a5.habitat_type, a6.nutrition_type, a7.care_type
	FROM tble_species a1
	INNER JOIN tbl_animalia a2 ON a2.animals_id = a1.species_animalia
	INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
	INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
	INNER JOIN tble_habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN tble_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN tble_care a7 ON a7.care_id = a1.species_care
	WHERE species_name = 'jaguar'
;

SELECT 
	a1.species_name, a2.animals_type, a3.class_type, a4.order_type, a5.habitat_type, a6.nutrition_type, a7.care_type
	FROM tble_species a1
	INNER JOIN tbl_animalia a2 ON a2.animals_id = a1.species_animalia
	INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
	INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
	INNER JOIN tble_habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN tble_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN tble_care a7 ON a7.care_id = a1.species_care
	WHERE species_name = 'penguin'
;

SELECT 
	a1.species_name, a2.animals_type, a3.class_type, a4.order_type, a5.habitat_type, a6.nutrition_type, a7.care_type
	FROM tble_species a1
	INNER JOIN tbl_animalia a2 ON a2.animals_id = a1.species_animalia
	INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
	INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
	INNER JOIN tble_habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN tble_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN tble_care a7 ON a7.care_id = a1.species_care
	WHERE species_name = 'ghost bat'
;

SELECT 
	a1.species_name, a2.animals_type, a3.class_type, a4.order_type, a5.habitat_type, a6.nutrition_type, a7.care_type
	FROM tble_species a1
	INNER JOIN tbl_animalia a2 ON a2.animals_id = a1.species_animalia
	INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
	INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
	INNER JOIN tble_habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN tble_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN tble_care a7 ON a7.care_id = a1.species_care
	WHERE species_name = 'chicken'
;

SELECT 
	a1.species_name, a2.animals_type, a3.class_type, a4.order_type, a5.habitat_type, a6.nutrition_type, a7.care_type
	FROM tble_species a1
	INNER JOIN tbl_animalia a2 ON a2.animals_id = a1.species_animalia
	INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
	INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
	INNER JOIN tble_habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN tble_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN tble_care a7 ON a7.care_id = a1.species_care
	WHERE species_name = 'panda'
;

SELECT 
	a1.species_name, a2.animals_type, a3.class_type, a4.order_type, a5.habitat_type, a6.nutrition_type, a7.care_type
	FROM tble_species a1
	INNER JOIN tbl_animalia a2 ON a2.animals_id = a1.species_animalia
	INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
	INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
	INNER JOIN tble_habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN tble_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN tble_care a7 ON a7.care_id = a1.species_care
	WHERE species_name = 'bobcat'
;

SELECT 
	a1.species_name, a2.animals_type, a3.class_type, a4.order_type, a5.habitat_type, a6.nutrition_type, a7.care_type
	FROM tble_species a1
	INNER JOIN tbl_animalia a2 ON a2.animals_id = a1.species_animalia
	INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
	INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
	INNER JOIN tble_habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN tble_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN tble_care a7 ON a7.care_id = a1.species_care
	WHERE species_name = 'grey wolf'
;