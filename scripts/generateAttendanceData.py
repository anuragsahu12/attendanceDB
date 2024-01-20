import csv
from datetime import datetime, timedelta
import random

# Function to generate random dates in January 2024
def generate_random_date():
    start_date = datetime(2024, 1, 1)
    end_date = datetime(2024, 1, 31)
    random_date = start_date + timedelta(days=random.randint(0, (end_date - start_date).days))
    return random_date.strftime('%Y-%m-%d')

# Read CSV file
input_file_path = 'student_subjects.csv'
with open(input_file_path, 'r') as csvfile:
    csv_reader = csv.reader(csvfile)
    next(csv_reader)  # Skip header
    data = list(csv_reader)

# Generate attendance data with 10 classes for each subject
attendance_data = []
for row in data:
    roll_number, subject_id = row
    for _ in range(10):
        date = generate_random_date()
        present = random.choice(["true", "false"])
        proxy = "false"  # Assuming proxy is always false for now
        attendance_data.append((roll_number, subject_id, date, present, proxy))

# Write data to CSV file
output_csv_file = 'attendance_data.csv'
with open(output_csv_file, 'w', newline='') as csvfile:
    csv_writer = csv.writer(csvfile)
    # Write header
    csv_writer.writerow(['roll_number', 'subject_id', 'date', 'present', 'proxy'])
    # Write data
    csv_writer.writerows(attendance_data)

print(f'Data has been generated and saved to {output_csv_file}')
