import csv
import random

# Common subjects for all students
# [IoT, NNDL, CNS, AI]
common_subjects = ['CSE1818OE51', 'CSE1818PE63', 'CSE1818PE51', 'CSE1818OE41']

# Elective subjects (students choose one)
# [SE, CG]
elective_subjects = ['CSE1816OE11', 'CSE1815PE14']

# Branch transfer students
branch_transfer = ["200710207085", "200710307050", "200710207016"]


students_data = []

# ------------ UPTO 64 ------------------
# Generate data for all 64 students
for i in range(1, 65):
    if i == 2:
        continue
    roll_number = f'200710007{str(i).zfill(3)}'
    
    # Common subjects for all students
    for subject in common_subjects:
        students_data.append((roll_number, subject))

    # Elective subject (randomly choose one)
    elective_subject = random.choice(elective_subjects)
    students_data.append((roll_number, elective_subject))



# ------------ Branch Transfer ------------------
for roll_number in branch_transfer:
    # Common subjects for all students
    for subject in common_subjects:
        students_data.append((roll_number, subject))

    # Elective subject (randomly choose one)
    elective_subject = random.choice(elective_subjects)
    students_data.append((roll_number, elective_subject))


# ------------ Lateral ------------------
for i in range(1, 7):
    roll_number = f'2100750007{str(i).zfill(3)}'
    
    # Common subjects for all students
    for subject in common_subjects:
        students_data.append((roll_number, subject))

    # Elective subject (randomly choose one)
    elective_subject = random.choice(elective_subjects)
    students_data.append((roll_number, elective_subject))


# Write data to CSV file
csv_file_path = 'student_subjects.csv'
with open(csv_file_path, 'w', newline='') as csvfile:
    csv_writer = csv.writer(csvfile)
    # Write header
    csv_writer.writerow(['roll_number', 'subject_id'])
    # Write data
    csv_writer.writerows(students_data)

print(f'Data has been generated and saved to {csv_file_path}')

