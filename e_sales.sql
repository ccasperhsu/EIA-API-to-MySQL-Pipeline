CREATE DATABASE IF NOT EXISTS eia_electricity_sale;

-- original table
CREATE TABLE IF NOT EXISTS e_sales (
		period VARCHAR(25) NOT NULL,
        stateid VARCHAR(5) NOT NULL,
        sectorid VARCHAR(10) NOT NULL,
        customers INT NOT NULL,
        price INT NOT NULL,
        revenue INT NOT NULL,
        sales INT NOT NULL,
        PRIMARY KEY (period, stateid, sectorid)
    );

-- testing with new API route
CREATE TABLE IF NOT EXISTS e_sales_annual (
		period VARCHAR(25) NOT NULL,
        stateid VARCHAR(5) NOT NULL,
        sectorid VARCHAR(10) NOT NULL,
        customers INT NOT NULL,
        price INT NOT NULL,
        revenue INT NOT NULL,
        sales INT NOT NULL,
        PRIMARY KEY (period, stateid, sectorid)
    );

-- testing with nulls included
 CREATE TABLE IF NOT EXISTS e_sales_null (
		period VARCHAR(25),
        stateid VARCHAR(5),
        sectorid VARCHAR(10),
        customers INT,
        price INT,
        revenue INT,
        sales INT,
        PRIMARY KEY (period, stateid, sectorid)
    );   

select * from e_sales_null;