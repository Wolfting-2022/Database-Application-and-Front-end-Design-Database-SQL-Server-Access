use Assignment1;

DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Order_status
DROP TABLE IF EXISTS ToolCategories;
DROP TABLE IF EXISTS Tools;
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;



CREATE TABLE Order_status (
	statusID INT PRIMARY KEY,
	status_name VARCHAR(10)			-- 0 rental /1 return/ 3 overdue
);


CREATE TABLE ToolCategories(
categoryID INT PRIMARY KEY,
category_name VARCHAR(30)
);

CREATE TABLE Tools(
toolID INT PRIMARY KEY,
tool_name VARCHAR(50),
model VARCHAR(30),
manufacture VARCHAR(50),
categoryID INT NOT NULL,
purchase_price DECIMAL,
rental_fee_per_day DECIMAL NOT NULL,
inventory INT,
FOREIGN KEY (categoryID) REFERENCES ToolCategories(categoryID));





CREATE TABLE Customers(
customerID INT PRIMARY KEY,
customer_name VARCHAR(50),
address VARCHAR(50),
phone_number VARCHAR(15) NOT NULL,
profession VARCHAR(20)
);



CREATE TABLE Employees(
employeeID int PRIMARY KEY,
firstName VARCHAR(50) NOT NULL,
lastName VARCHAR(50) NOT NULL,
username VARCHAR(50) NOT NULL,
password VARCHAR(50),
role VARCHAR(20),
department VARCHAR(20)
);




CREATE TABLE Orders (
    orderID INT PRIMARY KEY,
    order_date DATE,
	end_date DATE,

    customerID INT,
	employeeID INT,
    description VARCHAR(200),

	statusID INT,					
	deposit DECIMAL,
	total_price DECIMAL NOT NULL,
	FOREIGN KEY (customerID) REFERENCES Customers(customerID),
	FOREIGN KEY (employeeID) REFERENCES Employees(employeeID),
	FOREIGN KEY (statusID) REFERENCES Order_status(statusID)
);

CREATE TABLE OrderItems(
orderToolID INT PRIMARY KEY,
orderID INT,
toolID INT,
qty INT NOT NULL,

FOREIGN KEY(orderID) REFERENCES Orders(orderID),
FOREIGN KEY(toolID) REFERENCES Tools(toolID)
);


