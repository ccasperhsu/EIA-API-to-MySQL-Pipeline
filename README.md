# API to Database ETL Pipeline

The goal of this project is to construct an ETL (Extract, Transform, Load) pipeline using Python so that the connected database can receive updated, formatted data from an API when the script is executed. Additionally, when data containing duplicated records is retrieved from the API, the pipeline will only update duplicated records and insert new rows.

<img width="1139" height="271" alt="image" src="https://github.com/user-attachments/assets/fa94650c-86ea-4670-b0ac-9c6dd38fc878" />

## Python Libraries Used:
  - *os*: Provides access to operating-system level functionality such as file paths, environment variables, and directory manipulation.
  - *python-dotenv*: Loads environment variables from a .env file into the process environment, allowing sensitive information to be stored outside code.
  - *requests*: Handles sending HTTP requests to external APIs and retrieving responses. 
  - *pandas*: Allows for quick manipulation of structured data in table format.
  - *mysql-connector-python*: Provides a Python interface for connecting to MySQL databases and executing SQL queries.
 
## Data Source
The RESTful API we are working with is published by the Energy Information Administration. This API limits the data packages to 5,000 records, but there is no explitcitly stated limit to often one can call the GET request. 

<img width="1887" height="883" alt="image" src="https://github.com/user-attachments/assets/28ad3f3e-24d0-4b0e-a675-dedfde325a4c" />


The full documentation can be found on [EIA's API Technical Documentation](https://www.eia.gov/opendata/documentation.php#Submittingrequesttoour)

## High Level Workflow

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
