Use Adventure_works;

Select * from dimcustomer;

ALTER TABLE dimcustomer
ADD PRIMARY KEY (ï»¿CustomerKey);

ALTER TABLE DimDate
ADD PRIMARY KEY (ï»¿DateKey);

ALTER TABLE DimProduct
ADD PRIMARY KEY (ï»¿ProductKey);

ALTER TABLE DimProductCategory
ADD PRIMARY KEY (ï»¿ProductCategoryKey);

ALTER TABLE DimProductSubcategory
ADD PRIMARY KEY (ï»¿ProductSubcategoryKey);

ALTER TABLE DimSalesTerritory
ADD PRIMARY KEY (ï»¿SalesTerritoryKey);

ALTER TABLE sales
MODIFY COLUMN SalesOrderNumber VARCHAR(50);

ALTER TABLE sales
ADD PRIMARY KEY (SalesOrderNumber, SalesOrderLineNumber);

ALTER TABLE sales
ADD CONSTRAINT fk_sales_customer_and_product
FOREIGN KEY (CustomerKey)
REFERENCES DimCustomer(ï»¿CustomerKey);


ALTER TABLE sales
ADD CONSTRAINT fk_sales_product
FOREIGN KEY (ï»¿ProductKey)
REFERENCES dimproduct(ï»¿ProductKey);

ALTER TABLE sales
ADD CONSTRAINT fk_sales_orderdate
FOREIGN KEY (OrderDateKey)
REFERENCES DimDate(ï»¿DateKey);

ALTER TABLE sales
ADD CONSTRAINT fk_sales_territory
FOREIGN KEY (SalesTerritoryKey)
REFERENCES DimSalesTerritory(ï»¿SalesTerritoryKey);

ALTER TABLE DimProduct
ADD CONSTRAINT fk_product_subcategory
FOREIGN KEY (ProductSubcategoryKey)
REFERENCES DimProductSubcategory(ï»¿ProductSubcategoryKey);

ALTER TABLE dimproduct
MODIFY COLUMN ProductSubcategoryKey int;
