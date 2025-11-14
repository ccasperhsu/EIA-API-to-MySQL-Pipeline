# EIA API to MySQL Pipeline

"This time, we’ll be sending HTTP requests to a REST API endpoint, format the data into a clean, tabular structure and load them into a MySQL database using Python once again."

## Data Source
The API we are working with is published by the Energy Information Administration. The API limits the data packages to 5,000 records, but there is no limit to often one can call the GET request (double check).
You need to register for a free account in order to get the API key. We will store this sensitive information, along with our database credentials using Python's dotenv library. 

## Technologies Used:
- Python:
  - 
  - **Libraries**: os, request, pandas, python-dotenv, mysql-connector-python
- MySQL

ETL Pipeline Workflow

- Extract
	- Sending HTTP request to REST API using Python's request library.
	- Store desired data from returned JSON format into a variable.
- Transform
	- Appending each record into an empty list, and create a list with column names.
	- Create a Python DataFrame using the rows and column headers.
	- Handle null values.
- Load
	- Connect to database.
	- Using a cursor to execute SQL commands.
	- Turn rows from the DataFrame into tuples, and create a list with the tuples.
	- Update and insert.
  - Schedule the pipeline to be run every so often.
