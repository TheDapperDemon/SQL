/* MY QUERY */
CREATE DATABASE db_contactUSE db_contactCREATE TABLE tbl_info (    info_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),    phone_number VARCHAR(50) NOT NULL,    home_address VARCHAR(100) NOT NULL);INSERT INTO tbl_info    (phone_number, home_address)    VALUES    ('678-9563', 'Seattle, WA'),    ('420-1738', 'Renton, WA'),    ('420-4200', 'Bellevue, WA');CREATE TABLE tbl_person (    person_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),    person_fname VARCHAR(50) NOT NULL,    person_lname VARCHAR(50) NOT NULL,    person_info INT NOT NULL CONSTRAINT fk_info_id FOREIGN KEY REFERENCES tbl_info(info_id) ON UPDATE CASCADE ON DELETE CASCADE);INSERT INTO tbl_person    (person_fname, person_lname, person_info)    VALUES    ('bruce', 'lee', 1),    ('the', 'rock', 2),    ('chuck', 'norris', 3);SELECT * FROM tbl_person;SELECT * FROM tbl_info;SELECT a1.person_fname, a1.person_lname, a2.phone_number, a2.home_addressFROM tbl_person a1INNER JOIN tbl_info a2 ON a2.info_id = a1.person_info;
/* END MY QUERY */

/* Variable Practice */
PRINT 'HELLO WORLD!'

DECLARE @MyVariable INT
SET @MyVariable = 6
PRINT @MyVariable

DECLARE @var1 INT, @var2 INT
SET @var1 = 3
SET @var2 = 5

PRINT 'Variable 1 = ' + CONVERT(varchar(5),@var1) + CHAR(13) + 'Variable 2 = ' + CONVERT(varchar(5),@var2) + CHAR(13) + 'Total:...'
PRINT @var1 + @var2

IF @var1 <= 3
	BEGIN
		PRINT 'Variable 1 <= ' + CONVERT(varchar(5),@var1) + CHAR(13)
	END
ELSE
	BEGIN
		PRINT 'Variable 1 is not < ' + CONVERT(varchar(5),@var1) + CHAR(13)
	END
/* END Variable Practice */