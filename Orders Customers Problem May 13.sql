DROP TABLE IF EXISTS orders;

CREATE TABLE Orders (
    Order_id INT PRIMARY KEY,
    Customer_id INT,
    Order_Date DATE,
    Amount DECIMAL(10, 2)
);

CREATE TABLE Customers (
    Customer_id INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Join_Date DATE
);


INSERT INTO Orders (Order_id, Customer_id, Order_Date, Amount)
VALUES
    (1, 1, '2024-05-01', 100),
    (2, 2, '2024-05-02', 150),
    (3, 3, '2023-12-15', 200),
    (4, 1, '2024-05-03', 120),
    (5, 2, '2024-01-20', 180),
    (6, 4, '2024-03-10', 90);

INSERT INTO Customers (Customer_id, Customer_Name, Join_Date)
VALUES
    (1, 'Alice', '2024-01-15'),
    (2, 'Bob', '2024-02-20'),
    (3, 'Charlie', '2023-12-01'),
    (4, 'David', '2024-03-01');
	
SELECT * FROM ORDERS
SELECT * FROM CUSTOMERS


--Write an SQL query to calculate the total order amount for each customer who joined in the current year. 

--The output should contain Customer_Name and the total amount.


SELECT c.CUSTOMER_NAME,
       SUM(o.amount) AS TOTAL_ORDER_AMOUNT
FROM CUSTOMERS c
LEFT JOIN ORDERS o
ON c.CUSTOMER_ID=o.CUSTOMER_ID
WHERE EXTRACT (YEAR FROM c.JOIN_DATE)=EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY c.CUSTOMER_NAME


-- Write a SQL query to return each month total orders for current year
-- return month_number, total orders


SELECT EXTRACT(MONTH FROM ORDER_DATE) AS MONTH_NO,
       COUNT(ORDER_ID) AS TOTAL_COUNT
FROM ORDERS
WHERE EXTRACT(YEAR FROM ORDER_DATE)=EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY EXTRACT(MONTH FROM ORDER_DATE);
       