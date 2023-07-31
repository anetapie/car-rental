CREATE DATABASE project_3
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


CREATE TABLE city (
	city_id INTEGER NOT NULL,
	city_name VARCHAR(30) NOT NULL,
	area VARCHAR(50) NOT NULL,
	zip_code CHAR(6),
	tel_number INTEGER,
	CONSTRAINT pk_city PRIMARY KEY(city_id)
);

CREATE TABLE employee (
	employee_id INTEGER NOT NULL,
	name VARCHAR(30) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	department VARCHAR(50) NOT NULL,
	city_id INTEGER NOT NULL,
	position VARCHAR(50) NOT NULL,
	CONSTRAINT pk_employee PRIMARY KEY(employee_id),
	CONSTRAINT fk_employee_city_city_id FOREIGN KEY(city_id) REFERENCES city(city_id)
); 


CREATE TABLE car (
	car_id INTEGER NOT NULL,
	manufacturer VARCHAR(30) NOT NULL,
	model VARCHAR(50) NOT NULL,
	engine_size NUMERIC(2,1),
	horsepower INTEGER,
	fuel_capacity NUMERIC(3,1),
	CONSTRAINT pk_car PRIMARY KEY(car_id)
); 


CREATE TABLE client (
	client_id INTEGER NOT NULL,
	name VARCHAR(30) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	age INTEGER, 
	tel_number INTEGER,
	credit_card_no INTEGER,
	PESEL CHAR(6),
	CONSTRAINT pk_client PRIMARY KEY(client_id)
); 


CREATE TABLE rent (
	rent_id INTEGER NOT NULL,
	client_id INTEGER NOT NULL,	
	car_id INTEGER NOT NULL,
	employee_id_pickup INTEGER NOT NULL,
	employee_id_return INTEGER,
	city_id_pickup INTEGER NOT NULL,
	city_id_return INTEGER,
	date_pickup DATE,
	date_return DATE,
	deposit INTEGER,
	CONSTRAINT pk_rent PRIMARY KEY(rent_id),
	CONSTRAINT fk_rent_client_client_id FOREIGN KEY(client_id) REFERENCES client(client_id),
	CONSTRAINT fk_rent_car_car_id FOREIGN KEY(car_id) REFERENCES car(car_id),
	CONSTRAINT fk_rent_employee_employee_id_pickup FOREIGN KEY(employee_id_pickup) REFERENCES employee(employee_id),
	CONSTRAINT fk_rent_employee_employee_id_return FOREIGN KEY(employee_id_return) REFERENCES employee(employee_id),
	CONSTRAINT fk_rent_city_city_id_pickup FOREIGN KEY(city_id_pickup) REFERENCES city(city_id),
	CONSTRAINT fk_rent_city_city_id_return FOREIGN KEY(city_id_return) REFERENCES city(city_id)
); 

SELECT * FROM rent;
------------------------

INSERT INTO city VALUES(1, 'Wroclaw', 'Wroclaw-airport', '54-530', 909962280);
INSERT INTO city VALUES(2, 'Wroclaw', 'Wroclaw-center', '50-102', 917881176);
INSERT INTO city VALUES(3, 'Warszawa', 'Warszawa-airport', '00-906', 506541006);
INSERT INTO city VALUES(4, 'Warszawa', 'Warszawa-center', '00-110', 600048223);
INSERT INTO city VALUES(5, 'Poznan', 'Poznan-airport', '60-189', 356541321);
INSERT INTO city VALUES(6, 'Poznan', 'Poznan-center', '60-778', 635000481);
INSERT INTO city VALUES(7, 'Krakow', 'Krakow-airport', '32-083', 356541321);
INSERT INTO city VALUES(8, 'Krakow', 'Krakow-center', '31-923', 635000481);

SELECT * FROM city;


COPY car
FROM 'D:\projekt_3\Car_sales.csv'
WITH (FORMAT CSV, HEADER,DELIMITER ';');

SELECT * FROM car;

ALTER TABLE employee DROP COLUMN position;

INSERT INTO employee VALUES(1, 'Ania', 'Kowalska', 'customer service', 1);
INSERT INTO employee VALUES(2, 'Wojtek', 'Lenard', 'receptionist', 2);
INSERT INTO employee VALUES(3, 'Karol', 'Majcher', 'project manager', 2);
INSERT INTO employee VALUES(4, 'Ala', 'Wysocka', 'project manager', 4);
INSERT INTO employee VALUES(5, 'Ola', 'Siejka', 'project manager', 6);
INSERT INTO employee VALUES(6, 'Adam', 'Czarny', 'project manager', 8);
INSERT INTO employee VALUES(7, 'Sara', 'Pestka', 'project manager', 3);
INSERT INTO employee VALUES(8, 'Krzysztof', 'Kubica', 'customer service', 2);
INSERT INTO employee VALUES(9, 'Olaf', 'Nowak', 'customer service', 3);
INSERT INTO employee VALUES(10, 'Artur', 'Mazurek', 'customer service', 4);
INSERT INTO employee VALUES(11, 'Wojtek', 'Adamik', 'marketing manager', 5);
INSERT INTO employee VALUES(12, 'Tomasz', 'Kulczycki', 'customer service',6);
INSERT INTO employee VALUES(13, 'Ania', 'Wolna', 'customer service',7);
INSERT INTO employee VALUES(14, 'Iga', 'Nowak', 'customer service',8);
INSERT INTO employee VALUES(15, 'Adam', 'Wysocki', 'customer service', 4);
INSERT INTO employee VALUES(16, 'Dorota', 'Kolenda', 'customer service', 5);
INSERT INTO employee VALUES(17, 'Monika', 'Malik', 'project manager', 7);

SELECT * FROM employee;

SELECT * FROM client;
SELECT * FROM rent;