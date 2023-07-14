CREATE DATABASE SALESCOMPANY;
CREATE TABLE Salesman
(
  salesman_id int,
  name varchar(50),
  city varchar (50),
  commission float,
)
INSERT INTO Salesman(salesman_id, name, city, commission) VALUES (5006, 'Mc Lyon', 'Paris', 0.14), (5002, ' Nail Knite ', 'Paris', 0.13), (5005, 'Pit Alex', 'London   ', 0.11);
SELECT * from Salesman;

CREATE TABLE customer
(
  customer_id  int,
  name varchar(50),
  city varchar (50),
  grade int,
  salesman_id float,

)

INSERT INTO customer(customer_id, name, city, grade, salesman_id) VALUES (3002 , ' Nick Rimando', 'New York', 100, 5001), (3007 , 'Brad Davis', 'New York', 200, 5001), (3005 , ' Nick Rimando', 'New York', 100, 5001);
SELECT * from customer;
SELECT * from Salesman;

SELECT customer.customer_id, customer.name, customer.city
FROM customer
JOIN Salesman ON customer.customer_id=Salesman.CustomerID;



