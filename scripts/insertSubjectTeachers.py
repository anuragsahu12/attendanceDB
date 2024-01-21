import pandas as pd
from sqlalchemy import create_engine

# PostgreSQL database connection parameters
db_params = {
    'host': 'localhost',
    'database': 'attendancedb',
    'user': 'postgres',
    'password': 'asd.123',
    'port': '5432'
}

# Read data from CSV file
csv_file_path = 'subject_teachers.csv'
data = pd.read_csv(csv_file_path)


# Establish a connection to the PostgreSQL database
engine = create_engine(f'postgresql+psycopg2://{db_params["user"]}:{db_params["password"]}@{db_params["host"]}:{db_params["port"]}/{db_params["database"]}')
connection = engine.connect()

# Insert data into the "subject_teachers" table
data.to_sql('subject_teachers', engine, if_exists='append', index=True, index_label='id', method='multi')

# Close the database connection
connection.close()

print('Data insertion into "subject_teachers" table completed.')
