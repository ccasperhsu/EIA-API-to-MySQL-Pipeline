# API to Database ETL Pipeline

## Table of Contents
- [Introduction](#introduction)
- [Python Libraries Used](#python-libraries-used)
- [Data](#data)
- [Workflow Overview](#workflow-overview)

## Introduction 

The goal of this project is to construct an ETL (Extract, Transform, Load) pipeline using Python so that the connected database can receive updated, formatted data from an API when the script is executed. Additionally, when data containing duplicated records is retrieved from the API, the pipeline will only update duplicated records and insert new rows.

The data collect on the sale of electricity can be used to perform inter-regional comparisons, time series analysis, customer segmentation analysis, just to name a few. While this project focuses on connecting a specific API to a database, the underlying workflow can be extended to other APIs/databases as well. 

## Python Libraries Used:
  - *os*: Provides access to operating-system level functionality such as file paths, environment variables, and directory manipulation.
  - *python-dotenv*: Loads environment variables from a .env file into the process environment, allowing sensitive information to be stored outside code.
  - *requests*: Handles sending HTTP requests to external APIs and retrieving responses. 
  - *pandas*: Allows for quick manipulation of structured data in table format.
  - *mysql-connector-python*: Provides a Python interface for connecting to MySQL databases and executing SQL queries.


## Data
The RESTful API we are working with is published by the Energy Information Administration (EIA) that provides monthly, quarterly, or annual data on the sale of electrictiy in the United State.  This API limits the data packages to 5,000 records, but there is no explitcitly stated limit to often one can call the GET request. 

The quantitative fields are the *number of customers*, *average price of electricity*, *revenue from the sale*, and *total quantity (in MWh) sold*.

<img width="1887" height="883" alt="image" src="https://github.com/user-attachments/assets/28ad3f3e-24d0-4b0e-a675-dedfde325a4c" />

### Sample Data

<img width="2788" height="960" alt="image" src="https://github.com/user-attachments/assets/6d500d02-cb99-4051-bd12-58223dbac25d" />

Further details can be found on [EIA's API Technical Documentation](https://www.eia.gov/opendata/documentation.php#Submittingrequesttoour).

## Workflow Overview

<img width="1139" height="271" alt="image" src="https://github.com/user-attachments/assets/fa94650c-86ea-4670-b0ac-9c6dd38fc878" />

- Extract
	- Send HTTP request to specified RESTful API using Python's request library and obtained API key.
- Transform
	- Parse through returned JSON data and store relevant data into variables.
 	- Format data into a Python DataFrame using numpy for ease of loading into MySQL.
	- Handle any null or missing values.
- Load
	- Connect to MySQL database using credentails stored in .env file.
	- Create a table (if neccessary), and insert formatted data using SQL commands.
   	- Update and insert data during subsequent attempts.
