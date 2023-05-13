CREATE DATABASE projects;

USE projects;

SELECT * FROM HR;

ALTER TABLE HR
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

DESCRIBE HR;

SELECT birthdate FROM HR;

SET sql_safe_updates = 0;

UPDATE HR
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE HR
MODIFY COLUMN birthdate DATE;

UPDATE HR
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE HR
MODIFY COLUMN hire_date DATE;

/*SELECT hire_date FROM HR;*/

UPDATE HR
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != ' ';

/*SELECT termdate FROM HR;*/

ALTER TABLE HR
MODIFY COLUMN termdate DATE;

ALTER TABLE HR ADD COLUMN age INT;

UPDATE HR
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM HR;

SELECT count(*) FROM HR WHERE age < 18;

SELECT count(*) FROM HR WHERE age > 18;

SELECT COUNT(*) FROM HR WHERE termdate > CURDATE();

SELECT COUNT(*)
FROM HR
WHERE termdate = '0000-00-00';

SELECT location FROM HR;