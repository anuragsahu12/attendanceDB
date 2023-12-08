-- insertion into users table
insert into users("id","password","username") values(1,'pass','user1');
insert into users("id","password","username") values(2,'pass','user2');
insert into users("id","password","username") values(3,'pass','user3');
insert into users("id","password","username") values(4,'pass','user4');
insert into users("id","password","username") values(5,'pass','user5');
insert into users("id","password","username") values(6,'pass','user6');

-- insertion into departments table
insert into departments("id","name") values(101,'Computer Science and Engineering');
insert into departments("id","name") values(102,'Mechanical Engineering');
insert into departments("id","name") values(103,'Civil Engineering');
insert into departments("id","name") values(104,'Electrical Engineering');
insert into departments("id","name") values(105,'Instrumentation Engineering');

--insertion into teachers table
insert into teachers("id","name","dept_id") values(1,'Erin Santos',101);
insert into teachers("id","name","dept_id") values(2,'Walker Conley',102);
insert into teachers("id","name","dept_id") values(3,'Salem Gonzalez',103);
insert into teachers("id","name","dept_id") values(4,'Ethan Bautista',104);
insert into teachers("id","name","dept_id") values(5,'Fox Carson',105);
insert into teachers("id","name","dept_id") values(6,'Nalani Barrera',101);

--insertion into students
insert into students("roll_number","name","dept_id","semester") values('1001','kuldeep singh',101,7);
insert into students("roll_number","name","dept_id","semester") values('2001','kanika kathuria',102,7);
insert into students("roll_number","name","dept_id","semester") values('3001','priya jain',103,7);
insert into students("roll_number","name","dept_id","semester") values('4001','anjali juneja',104,7);
insert into students("roll_number","name","dept_id","semester") values('5001','nitu kumari',105,7);
insert into students("roll_number","name","dept_id","semester") values('3002','rishav borah',103,7);
insert into students("roll_number","name","dept_id","semester") values('2002','randeep gogoi',102,7);
insert into students("roll_number","name","dept_id","semester") values('1002','rajiv das',101,7);
insert into students("roll_number","name","dept_id","semester") values('5002','disha malhotra',105,7);

--insertion into subjects
insert into subjects("id","name","dept_id","semester","teacher_id") values('CSE1817PE41','Cloud Computing',101,7,1);
insert into subjects("id","name","dept_id","semester","teacher_id") values('ME181701','Vibration of Mechanical Systems',102,7,2);
insert into subjects("id","name","dept_id","semester","teacher_id") values('CE181701','Quantity Surveying',103,7,3);
insert into subjects("id","name","dept_id","semester","teacher_id") values('EE181701','Power System-IV',104,7,4);
insert into subjects("id","name","dept_id","semester","teacher_id") values('IE181701','Telemetry and Tele Control',105,7,5);
insert into subjects("id","name","dept_id","semester","teacher_id") values('CSE1817OE21','Machhine Learning',101,7,6);

-- insertion into attendance table
insert into attendance("roll_number","subject_id","date","present") values('1001','CSE1817PE41','08-11-2023',true);
insert into attendance("roll_number","subject_id","date","present") values('2001','ME181701','08-11-2023',true);
insert into attendance("roll_number","subject_id","date","present") values('3001','CE181701','08-11-2023',true);
insert into attendance("roll_number","subject_id","date","present") values('4001','EE181701','08-11-2023',true);
insert into attendance("roll_number","subject_id","date","present") values('5001','IE181701','08-11-2023',true);
insert into attendance("roll_number","subject_id","date","present") values('3002','CE181701','08-11-2023',true);
