


-- Вывести заказы со стоимостью от 5000 и более EUR (проекция: номер_заказа, стоимость_заказа)

SELECT *
FROM orders
WHERE total_cost >= 5000;

-- Вывести страны, в которые было отправлено 3 и более заказов

SELECT country
FROM orders
GROUP BY country
HAVING COUNT(*) >= 3;

-- Вывести ТОП-10 самых продаваемых товаров (проекция: название_товара, ко_во_проданных_единиц)

SELECT products.productName AS productName, SUM(OrderDetails.Quantity) AS totalquantity
FROM orderDetails
JOIN products ON orderDetails.productID = products.productID
GROUP BY products.productName
ORDER BY TotalQuantity DESC
LIMIT 10;

-- Расчитать З/П менеджеров (ставка - 5% от суммы проданных заказов)

SELECT 
    EmployeeID,
    LastName,
    Salary * 0.05 AS Manager_Salary,
    SUM(od.Quantity * od.UnitPrice) AS Total_Sales_Amount
FROM 
    Employees 
JOIN 
    Orders o ON EmployeeID = EmployeeID
JOIN 
    OrderDetails  ON OrderID = OrderID
GROUP BY 
    EmployeeID, LastName, Salary;