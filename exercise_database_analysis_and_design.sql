CREATE DATABASE exercise2;
USE exercise2;
CREATE TABLE customers(
    customerNumber INT AUTO_INCREMENT PRIMARY KEY ,
    salesRepEmployeeNumber INT NOT NULL REFERENCES employees(employeeNumber),
    customerName VARCHAR(50) NOT NULL ,
    contactLastName VARCHAR(50) NOT NULL ,
    contactFirstName VARCHAR(50) NOT NULL ,
    phone varchar(50) NOT NULL ,
    addressLine1 varchar(50) NOT NULL ,
    addressLine2 varchar(50) ,
    city varchar(50) NOT NULL ,
    state varchar(50) NOT NULL ,
    postalCode varchar(15) NOT NULL ,
    country varchar(50) NOT NULL ,
    creditLimit DOUBLE
);
CREATE TABLE orders(
    orderNumber INT AUTO_INCREMENT PRIMARY KEY ,
    customerNumber INT NOT NULL REFERENCES customers(customerNumber),
    orderDate DATETIME,
    requiredDate DATETIME,
    shipped DATETIME,
    status VARCHAR(15),
    comment TEXT
--    quantityOrdered INT NOT NULL ,
--    priceEach DOUBLE NOT NULL
);
CREATE TABLE payments(
    customerNumber INT NOT NULL REFERENCES customers(customerNumber),
    checkNumber VARCHAR(50) PRIMARY KEY ,
    paymentDate DATETIME,
    amount DOUBLE NOT NULL
);
CREATE TABLE OrderDetails(
    orderNumber INT NOT NULL REFERENCES orders(orderNumber),
    productCode VARCHAR(15) NOT NULL REFERENCES products(productCode),
    quantityOrdered INT NOT NULL ,
    priceEach DOUBLE NOT NULL ,
    orderLineNumber INT NOT NULL
);
CREATE TABLE products(
    productCode VARCHAR(15) PRIMARY KEY ,
    productLine VARCHAR(50) NOT NULL REFERENCES productlines(productLine),
    productName VARCHAR(70) NOT NULL ,
    productScale VARCHAR(10) NOT NULL ,
    productVendor VARCHAR(50) NOT NULL ,
    productDescription TEXT NOT NULL ,
    quantityInStock INT NOT NULL ,
    buyPrice DOUBLE NOT NULL ,
    MSRP DOUBLE NOT NULL
);
CREATE TABLE productlines(
    productLine VARCHAR(50) PRIMARY KEY ,
    textDescription TEXT,
    image VARCHAR(255)
);
CREATE TABLE employees(
    employeeNumber INT PRIMARY KEY ,
    reportTo VARCHAR(255) NOT NULL REFERENCES employees(employeeNumber),
    officeCode VARCHAR(10) NOT NULL REFERENCES offices(officeCode),
    lastName VARCHAR(50) NOT NULL ,
    firstName VARCHAR(50) NOT NULL ,
    email VARCHAR(100) NOT NULL ,
    jobTitle VARCHAR(50) NOT NULL


);
CREATE TABLE offices(
    officeCode VARCHAR(10) PRIMARY KEY ,
    city VARCHAR(50) NOT NULL ,
    phone VARCHAR(50) NOT NULL ,
    addressLine1 VARCHAR(50) NOT NULL ,
    addressLine2 VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50) NOT NULL ,
    postalCode VARCHAR(15) NOT NULL
);
