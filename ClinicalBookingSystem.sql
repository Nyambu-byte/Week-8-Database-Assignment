-- Create database Clinic Booking System
CREATE DATABASE IF NOT EXISTS clinic_booking_system;
USE clinic_booking_system;

-- 1. Departments
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Doctors
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 3. Patients
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    dob DATE,
    gender ENUM('Male', 'Female', 'Other')
);

-- 4. Appointments
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_date DATETIME NOT NULL,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    reason TEXT,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- 5. Payments
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT UNIQUE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    method ENUM('Cash', 'Card', 'Insurance') NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);