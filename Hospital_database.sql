CREATE TABLE patient(
	patient_id INT PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	address VARCHAR(256) NOT NULL,
	sex VARCHAR(1),
	phone VARCHAR(20),
	age SMALLINT NOT NULL,
	birthdate DATE NOT NULL,
	disease VARCHAR(1000) NOT NULL,
	treatment VARCHAR(1000) NOT NULL,
	days_spent INT NOT NULL,
	bill NUMERIC(10, 2) NOT NULL,
	room_id INT,
	doctor_id INT
)

CREATE TABLE doctor(
	doctor_id INT PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
)

ALTER TABLE patient
ADD FOREIGN KEY(doctor_id)
REFERENCES doctor(doctor_id)
ON DELETE SET NULL

CREATE TABLE nurses_and_wardboy(
	emp_id INT PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	job_title VARCHAR(100)
)

CREATE TABLE rooms(
	room_id INT PRIMARY KEY,
	room_name VARCHAR(1000)
)

ALTER TABLE patient
ADD FOREIGN KEY(room_id)
REFERENCES rooms(room_id)
ON DELETE SET NULL

CREATE TABLE takes_care_of(
	emp_id INT,
	patient_id INT,
	PRIMARY KEY(emp_id,patient_id),
	FOREIGN KEY(emp_id) REFERENCES nurses_and_wardboy(emp_id)
	ON DELETE CASCADE,
	FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
	ON DELETE CASCADE
)