/* Creating queries */ 


-- 1. List the car brands that are in the car rental.  

SELECT DISTINCT manufacturer 
FROM car
ORDER BY manufacturer;


-- 2. List the number of cars by car class.  

SELECT class_car, count(*) AS "sum"
FROM car
GROUP BY class_car
ORDER BY "sum" DESC;


-- 3. List the brands of cars that are in class C.

SELECT DISTINCT manufacturer 
FROM car
WHERE class_car = 'C'
ORDER BY manufacturer;


-- 4. List the number of clients by age.

SELECT age, count(*) AS "sum"
FROM client
GROUP BY age
ORDER BY "sum" DESC;


-- 5. List selected customers in the following age ranges: 18-24, 25-34, 35-44, 45-54, over 55.

SELECT "age_groups", count(*)
FROM (
SELECT age, CASE
	WHEN AGE < 18 THEN 'Under 18'
	WHEN AGE BETWEEN 18 AND 24 THEN '18 - 24'
	WHEN AGE BETWEEN 25 AND 34 THEN '25 - 34'
	WHEN AGE BETWEEN 35 AND 44 THEN '35 - 44'
	WHEN AGE BETWEEN 45 AND 54 THEN '45 - 54'
    WHEN AGE >= 55 THEN 'Over 50'
	END AS "age_groups"
FROM client
) t
GROUP BY "age_groups"
ORDER BY "age_groups";


-- 6. List the employees along with the cities and areas in which they work.

SELECT lt.name, lt.last_name, rt.city_name, rt.area	 
FROM employee AS lt
LEFT JOIN city AS rt
ON lt.city_id = rt.city_id
ORDER BY rt.area;


-- 7. List how many employees work in each area.
  
SELECT * FROM employee;
SELECT count(last_name) FROM employee;
	  
SELECT city.area, count(employee.last_name) AS "sum_employee" 
FROM employee
LEFT JOIN city
ON employee.city_id = city.city_id
GROUP BY city.area
ORDER BY "sum_employee" DESC;  


-- 8. Are there customers who have rented a car more than once? If so, who and how many times?

SELECT lt.client_id, rt.name, rt.last_name, COUNT(lt.client_id) AS "sum_rent"
FROM rent AS lt
LEFT JOIN client AS rt
ON lt.client_id = rt.client_id
GROUP BY lt.client_id, rt.name, rt.last_name
HAVING COUNT(lt.client_id) > 1
ORDER BY "sum_rent" DESC;


-- 9. For how many days were cars rented most often?

SELECT date_pickup, date_return, (date_return - date_pickup) AS "sum_day" 
FROM rent
ORDER BY "sum_day" DESC;

SELECT (date_return - date_pickup) AS "sum_day", count(date_return - date_pickup) AS "quantity"
FROM rent
GROUP BY "sum_day"
ORDER BY "quantity" DESC;

  
-- 10. List the sum of rentals of each class of car. 

SELECT rt.class_car, COUNT(rt.class_car) AS "sum"
FROM rent AS lt
LEFT JOIN car AS rt
ON lt.car_id = rt.car_id
GROUP BY rt.class_car
ORDER BY "sum" DESC;


-- 11. List the amount the customers had to pay for each car rental.

SELECT 
	t2.name, 
	t2.last_name, 
	(t1.date_return - t1.date_pickup) AS "sum_day", 
	((t1.date_return - t1.date_pickup)* t4.price_per_day) AS "sum_price" 
FROM rent AS t1
LEFT JOIN client AS t2
ON t2.client_id = t1.client_id
LEFT JOIN car AS t3
ON t3.car_id = t1.car_id
LEFT JOIN price AS t4
ON t4.class_car = t3.class_car;


-- 12. Show the total amount the customers had to pay for all rentals.

SELECT 
	sum((t1.date_return - t1.date_pickup)* t4.price_per_day) AS "sum_price" 
FROM rent AS t1
LEFT JOIN car AS t3
ON t3.car_id = t1.car_id
LEFT JOIN price AS t4
ON t4.class_car = t3.class_car;


-- 13. List the phone number of each employee with the department and area.

SELECT 
	t1.name, 
	t1.last_name,
	t1.department,
	t2.area,
	t2.tel_number
FROM employee AS t1
LEFT JOIN city AS t2
ON t2.city_id = t1.city_id;
