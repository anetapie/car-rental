/* Create tables */

DROP TABLE IF EXISTS rent;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS city; 
DROP TABLE IF EXISTS price;
DROP TABLE IF EXISTS client;

-- Table 1. "city"

CREATE TABLE city (
	city_id INTEGER NOT NULL,
	city_name VARCHAR(30) NOT NULL,
	area VARCHAR(50) NOT NULL,
	zip_code CHAR(6),
	tel_number INTEGER,
	CONSTRAINT pk_city PRIMARY KEY(city_id)
);

INSERT INTO city VALUES(1, 'Wroclaw', 'Wroclaw-airport', '54-530', 909962280);
INSERT INTO city VALUES(2, 'Wroclaw', 'Wroclaw-center', '50-102', 917881176);
INSERT INTO city VALUES(3, 'Warszawa', 'Warszawa-airport', '00-906', 506541006);
INSERT INTO city VALUES(4, 'Warszawa', 'Warszawa-center', '00-110', 600048223);
INSERT INTO city VALUES(5, 'Poznan', 'Poznan-airport', '60-189', 356541321);
INSERT INTO city VALUES(6, 'Poznan', 'Poznan-center', '60-778', 635000481);
INSERT INTO city VALUES(7, 'Krakow', 'Krakow-airport', '32-083', 356541321);
INSERT INTO city VALUES(8, 'Krakow', 'Krakow-center', '31-923', 635000481);


-- Table 2. "table price"

CREATE TABLE price (
	class_car VARCHAR(10),  
	price_per_day DECIMAL(10,2),
	CONSTRAINT pk_class_car PRIMARY KEY(class_car)
);

INSERT INTO price VALUES('A',109.00);
INSERT INTO price VALUES('B',139.00);
INSERT INTO price VALUES('C',169.00);


-- Table 3. "employee"

CREATE TABLE employee (
	employee_id INTEGER NOT NULL,
	name VARCHAR(30) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	department VARCHAR(50) NOT NULL,
	city_id INTEGER NOT NULL,
	CONSTRAINT pk_employee PRIMARY KEY(employee_id),
	CONSTRAINT fk_employee_city_city_id FOREIGN KEY(city_id) REFERENCES city(city_id)
); 

COPY employee
FROM '<ROOT_PATH>\data\employee.txt'
WITH (FORMAT CSV, DELIMITER ';');


-- Table 4.  "car"

CREATE TABLE car (
	car_id INTEGER NOT NULL,
	manufacturer VARCHAR(30) NOT NULL,
	model VARCHAR(50) NOT NULL,
	class_car VARCHAR(10),
	engine_size NUMERIC(2,1),
	horsepower INTEGER,
	CONSTRAINT pk_car PRIMARY KEY(car_id),
	CONSTRAINT fk_car_price_class_car FOREIGN KEY(class_car) REFERENCES price(class_car)
); 

COPY car
FROM '<ROOT_PATH>\data\car.txt'
WITH (FORMAT CSV, DELIMITER ';');


-- Table 5. "client"

CREATE TABLE client (
	client_id INTEGER NOT NULL,
	name VARCHAR(30) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	age INTEGER, 
	tel_number VARCHAR(50),
	credit_card_no VARCHAR(50),
	PESEL CHAR(11),
	CONSTRAINT pk_client PRIMARY KEY(client_id)
); 

COPY client
FROM '<ROOT_PATH>\data\client.txt'
WITH (FORMAT CSV, DELIMITER ';');


-- Table 6. "rent"

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
	CONSTRAINT pk_rent PRIMARY KEY(rent_id),
	CONSTRAINT fk_rent_client_client_id FOREIGN KEY(client_id) REFERENCES client(client_id),
	CONSTRAINT fk_rent_car_car_id FOREIGN KEY(car_id) REFERENCES car(car_id),
	CONSTRAINT fk_rent_employee_employee_id_pickup FOREIGN KEY(employee_id_pickup) REFERENCES employee(employee_id),
	CONSTRAINT fk_rent_employee_employee_id_return FOREIGN KEY(employee_id_return) REFERENCES employee(employee_id),
	CONSTRAINT fk_rent_city_city_id_pickup FOREIGN KEY(city_id_pickup) REFERENCES city(city_id),
	CONSTRAINT fk_rent_city_city_id_return FOREIGN KEY(city_id_return) REFERENCES city(city_id)
); 

COPY rent
FROM '<ROOT_PATH>\data\rent.txt'
WITH (FORMAT CSV, DELIMITER ';');
