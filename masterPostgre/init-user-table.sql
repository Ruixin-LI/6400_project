CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS doctor (
    name VARCHAR(255) PRIMARY KEY,
    type VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS patient (
    ssn VARCHAR(11) PRIMARY KEY, --assuming ssn format of XXX-XX-XXXX
    name VARCHAR(255) NOT NULL,
    DOB DATE,
    race VARCHAR(255),
    gender VARCHAR(255),
    marital_status VARCHAR(255)
    address VARCHAR(255)
    phone VARCHAR(255) --assuming format XXX-XXX-XXXX
);

CREATE TABLE IF NOT EXISTS medical_office(
    address VARCHAR(255) 
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS treatment_plan(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    dosage VARCHAR(255),
    patient_ssn VARCHAR(255),
    doctor_name VARCHAR(255),
    FOREIGN KEY (patient_ssn) REFERENCES patient(ssn),
    FOREIGN KEY (doctor_name) REFERENCES doctor(name)
);

CREATE TABLE IF NOT EXISTS payment(
    payment_type VARCHAR(255) PRIMARY KEY,
    payment_date DATE,
    payment_status VARCHAR(255),
    patient_ssn VARCHAR(255),
    FOREIGN KEY patient_ssn REFERENCES patient(ssn)
);

CREATE TABLE IF NOT EXISTS make_appointment(
    appt_date DATE,
    appt_time TIME,
    reason VARCHAR(255),
    patient_ssn VARCHAR(255),
    doctor_name VARCHAR(255),
    FOREIGN KEY (patient_ssn) REFERENCES patient(ssn),
    FOREIGN KEY (doctor_name) REFERENCES doctor(name)
);

CREATE TABLE IF NOT EXISTS work_at(
    doctor_name VARCHAR(255),
    office_name VARCHAR(255),
    address VARCHAR(255),
    FOREIGN KEY (doctor_name) REFERENCES doctor(name),
    FOREIGN KEY (office_name) REFERENCES medical_office(name),
    FOREIGN KEY (address) REFERENCES medical_office(address),
);

CREATE TABLE IF NOT EXISTS visits(
    patient_ssn VARCHAR(11),
    office_name VARCHAR(255),
    address VARCHAR(255),
    FOREIGN KEY (patient_ssn) REFERENCES patient(ssn),
    FOREIGN KEY (office_name) REFERENCES medical_office(name),
    FOREIGN KEY (address) REFERENCES medical_office(address),
);

CREATE TABLE IF NOT EXISTS sent_to(
    office_name VARCHAR(255),
    address VARCHAR(255),
    payment_type VARCHAR(255),
    FOREIGN KEY (office_name) REFERENCES medical_office(name),
    FOREIGN KEY (address) REFERENCES medical_office(address),
    FOREIGN KEY (payment_type) REFERENCES payment(payment_type)
);

CREATE TABLE IF NOT EXISTS system_info(
    doctor_log_in VARCHAR(255)
);

