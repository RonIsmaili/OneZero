--CREATION OF DATABASE
CREATE DATABASE OneZero
GO
USE OneZero
GO

--CREATION OF TABLES
CREATE TABLE Employee
(
employee_id int not null,
employee_ssn int,
employee_fname varchar(20),
employee_lname varchar(20),
employee_salary money,
working_hours int,
store_id int not null
)
GO

CREATE TABLE Employee_Manager
(
manager_id int not null,
store_id int not null
)
GO

CREATE TABLE Employee_Technician
(
technician_id int not null
)
GO

CREATE TABLE Employee_Clerk
(
clerk_id int not null
)
GO

CREATE TABLE Invoice
(
invoice_id int not null,
invoice_datetime date,
invoice_time time,
invoice_price money
)
GO

CREATE TABLE Invoice_Supply
(
invoice_supply_id int not null,
invoice_s_quantity int,
manager_id int not null
)
GO

CREATE TABLE Invoice_Service
(
invoice_service_id int not null,
technician_id int not null,
customer_id int not null
)
GO

CREATE TABLE Invoice_Product
(
invoice_product_id int not null,
invoice_product_quantity int,
customer_id int not null,
clerk_id int not null
)
GO

CREATE TABLE Store
(
store_id int not null,
store_location varchar(50)
)
GO

CREATE TABLE Product
(
product_id int not null,
product_name varchar(50),
product_price money,
product_quantity int
)
GO

CREATE TABLE Customer
(
customer_id int not null,
customer_fname varchar(20),
customer_lname varchar(20),
customer_username varchar(20),
customer_password varchar(20),
customer_birthdate date
)
GO

CREATE TABLE Supply
(
supply_id int not null,
supply_origin varchar(20),
supply_name varchar(20),
supply_price money,
supply_quantity int
)
GO

CREATE TABLE stored_in
(
product_id int not null,
store_id int not null
)
GO

CREATE TABLE product_description
(
product_id int not null,
invoice_product_id int not null
)
GO

CREATE TABLE supply_description
(
supply_id int not null,
invoice_supply_id int not null
)
GO
--ASSIGNMENT OF CONSTRAINTS
--PRIMARY KEYS
ALTER TABLE Employee
ADD CONSTRAINT PK_Employee PRIMARY KEY (employee_id);
GO
ALTER TABLE Employee_Manager
ADD CONSTRAINT PK_Employee_Manager PRIMARY KEY (manager_id);
GO
ALTER TABLE Employee_Technician
ADD CONSTRAINT PK_Employee_Technician PRIMARY KEY (technician_id);
GO
ALTER TABLE Employee_Clerk
ADD CONSTRAINT PK_Employee_Clerk PRIMARY KEY (clerk_id);
GO

ALTER TABLE Invoice
ADD CONSTRAINT PK_Invoice PRIMARY KEY (invoice_id);
GO
ALTER TABLE Invoice_Supply
ADD CONSTRAINT PK_Invoice_Supply PRIMARY KEY (invoice_supply_id);
GO
ALTER TABLE Invoice_Service
ADD CONSTRAINT PK_Invoice_Service PRIMARY KEY (invoice_service_id);
GO
ALTER TABLE Invoice_Product
ADD CONSTRAINT PK_Invoice_Product PRIMARY KEY (invoice_product_id);
GO

ALTER TABLE Store
ADD CONSTRAINT PK_Store PRIMARY KEY (store_id);
GO

ALTER TABLE Product
ADD CONSTRAINT PK_Product PRIMARY KEY (product_id);
GO

ALTER TABLE Customer
ADD CONSTRAINT PK_Customer PRIMARY KEY (customer_id);
GO

ALTER TABLE Supply
ADD CONSTRAINT PK_Supply PRIMARY KEY (supply_id);
GO

ALTER TABLE stored_in
ADD CONSTRAINT PK_stored_in PRIMARY KEY (product_id, store_id);
GO

ALTER TABLE product_description
ADD CONSTRAINT PK_product_description PRIMARY KEY (product_id, invoice_product_id);
GO

ALTER TABLE supply_description
ADD CONSTRAINT PK_supply_description PRIMARY KEY (supply_id, invoice_supply_id);
GO

--FOREIGN KEYS
ALTER TABLE Employee ADD CONSTRAINT FK_EmployeeStore
FOREIGN KEY (store_id) REFERENCES Store;
GO
ALTER TABLE Employee_Manager ADD CONSTRAINT FK_ManagerEmployee
FOREIGN KEY (manager_id) REFERENCES Employee;
GO
ALTER TABLE Employee_Manager ADD CONSTRAINT FK_ManagerStore
FOREIGN KEY (store_id) REFERENCES Store;
GO
ALTER TABLE Employee_Technician ADD CONSTRAINT FK_TechnicianEmployee
FOREIGN KEY (technician_id) REFERENCES Employee;
GO
ALTER TABLE Employee_Clerk ADD CONSTRAINT FK_ClerkEmployee
FOREIGN KEY (clerk_id) REFERENCES Employee;
GO

ALTER TABLE Invoice_Supply ADD CONSTRAINT FK_Invoice_SupplyInvoice
FOREIGN KEY (invoice_supply_id) REFERENCES Invoice;
GO
ALTER TABLE Invoice_Supply ADD CONSTRAINT FK_Invoice_SupplyManager
FOREIGN KEY (manager_id) REFERENCES Employee_Manager;
GO
ALTER TABLE Invoice_Service ADD CONSTRAINT FK_Invoice_ServiceInvoice
FOREIGN KEY (invoice_service_id) REFERENCES Invoice;
GO
ALTER TABLE Invoice_Service ADD CONSTRAINT FK_Invoice_ServiceTechnician
FOREIGN KEY (technician_id) REFERENCES Employee_Technician;
GO
ALTER TABLE Invoice_Service ADD CONSTRAINT FK_Invoice_ServiceCustomer
FOREIGN KEY (customer_id) REFERENCES Customer;
GO
ALTER TABLE Invoice_Product ADD CONSTRAINT FK_Invoice_ProductInvoice
FOREIGN KEY (invoice_product_id) REFERENCES Invoice;
GO
ALTER TABLE Invoice_Product ADD CONSTRAINT FK_Invoice_ProductCustomer
FOREIGN KEY (customer_id) REFERENCES Customer;
GO
ALTER TABLE Invoice_Product ADD CONSTRAINT FK_Invoice_ProductClerk
FOREIGN KEY (clerk_id) REFERENCES Employee_Clerk;
GO

ALTER TABLE stored_in ADD CONSTRAINT FK_stored_inProduct
FOREIGN KEY (product_id) REFERENCES Product;
GO
ALTER TABLE stored_in ADD CONSTRAINT FK_stored_inStore
FOREIGN KEY (store_id) REFERENCES Store;
GO

ALTER TABLE product_description ADD CONSTRAINT FK_product_descriptionProduct
FOREIGN KEY (product_id) REFERENCES Product;
GO
ALTER TABLE product_description ADD CONSTRAINT FK_product_descriptionInvoice
FOREIGN KEY (invoice_product_id) REFERENCES Invoice_Product;
GO

ALTER TABLE supply_description ADD CONSTRAINT FK_supply_descriptionSupply
FOREIGN KEY (supply_id) REFERENCES Supply;
GO
ALTER TABLE supply_description ADD CONSTRAINT FK_supply_descriptionInvoice
FOREIGN KEY (invoice_supply_id) REFERENCES Invoice_Supply;
GO

--UNIQUE
ALTER TABLE Employee_Manager ADD CONSTRAINT UQ_Employee_ManagerStore
UNIQUE (store_id);
GO
