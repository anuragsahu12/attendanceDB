import pandas as pd
import psycopg2
from sqlalchemy import create_engine

# PostgreSQL database connection parameters
db_params = {
    'host': 'your_host',
    'database': 'attendancedb',
    'user': 'your_user',
    'password': 'your_password',
    'port': 'your_port'
}

# Function to insert data into PostgreSQL table
def insert_data(engine, table_name, data_frame):
    data_frame.to_sql(table_name, engine, if_exists='replace', index=False)

# Read data from Excel file
excel_file_path = 'your_excel_file.xlsx'
excel_data = pd.read_excel(excel_file_path, sheet_name=None)

# Establish a connection to the PostgreSQL database
engine = create_engine(f'postgresql+psycopg2://{db_params["user"]}:{db_params["password"]}@{db_params["host"]}:{db_params["port"]}/{db_params["database"]}')
connection = engine.connect()

# List of tables in the order of insertion respecting foreign key constraints
tables_order = ['departments', 'teachers', 'students', 'subjects', 'subject_teachers', 'students_subjects', 'attendance']

# Iterate through each table
for table_name in tables_order:
    # Check if the table exists in the Excel file
    if table_name in excel_data:
        # Insert data into the corresponding table
        insert_data(engine, table_name, excel_data[table_name])
    else:
        print(f"Table {table_name} not found in the Excel file.")

# Close the database connection
connection.close()

print('Data insertion completed.')