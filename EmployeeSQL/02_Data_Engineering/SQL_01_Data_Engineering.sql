
--======================================================================
--======================================================================
-- Create Table # 1: tbl_departments
-- The column "dept_number" has been designated as the Primary Key.
-- This column contains only unique values. 
--======================================================================
--======================================================================

DROP TABLE IF EXISTS tbl_departments;

CREATE TABLE "tbl_departments" 
(
    "dept_number" VARCHAR(20) NOT NULL,
    "dept_name" VARCHAR(50) NOT NULL,
    CONSTRAINT "tbl_departments_PK" PRIMARY KEY (dept_number)
)
;

--======================================================================
-- Check the structure of the Table
--======================================================================

SELECT
	*
FROM 
	tbl_departments 
;

--======================================================================
-- Import data from the csv file "data_departments" 
-- This is done via the Import/Export Feature
--======================================================================


--======================================================================
-- Check the data imported into the Table
-- Check # 1: Sanity check for the first 10 rows of data 
-- Check # 2: Verify that the row count matches the csv file (9)
--======================================================================

SELECT
	*
FROM
	tbl_departments
LIMIT 10
;


SELECT
	COUNT(*)
FROM
	tbl_departments
;



--======================================================================
--======================================================================
-- Create Table # 2: tbl_employees
-- The column "emp_number" has been designated as the Primary Key.
-- This column contains only unique values. 
--======================================================================
--======================================================================

DROP TABLE IF EXISTS tbl_employees;

CREATE TABLE "tbl_employees" 
(
    "emp_number" INT NOT NULL,
    "emp_birth_date" DATE NOT NULL,
    "emp_first_name" VARCHAR(40) NOT NULL,
    "emp_last_name" VARCHAR(40) NOT NULL,
    "emp_gender" VARCHAR(10) NOT NULL,
    "emp_hire_date" DATE NOT NULL,
    CONSTRAINT "tbl_employees_PK" PRIMARY KEY (emp_number)
)
;

--======================================================================
-- Check the structure of the Table
--======================================================================

SELECT
	*
FROM
	tbl_employees
;

--======================================================================
-- Import data from the csv file "data_employees" 
-- This is done via the Import/Export Feature
--======================================================================

--======================================================================
-- Check the data imported into the Table
-- Check # 1: Sanity check for the first 10 rows of data 
-- Check # 2: Verify that the row count matches the csv file (300,024)
--======================================================================

SELECT
	*
FROM
	tbl_employees
LIMIT 10
;


SELECT
	COUNT(*)
FROM
	tbl_employees
;



--======================================================================
--======================================================================
-- Create Table # 3: tbl_salaries
-- The column "emp_number" has been designated as the Foreign Key.
-- This column references the column "emp_number" in the table "tbl_employees". 
-- The "ON DELETE CASCADE" clause has been added for referential integrity.
-- This Clause ensures that if:
-- a record in the parent table "tbl_employees" is deleted, 
-- then the corresponding records in this table will automatically be deleted. 
--======================================================================
--======================================================================

DROP TABLE IF EXISTS tbl_salaries;

CREATE TABLE "tbl_salaries" 
(
    "emp_number" INT NOT NULL,
    "emp_salary" INT NOT NULL,
    "sal_from_date" DATE NOT NULL,
    "sal_to_date" DATE NOT NULL,
	CONSTRAINT "tbl_salaries_emp_number_FK" FOREIGN KEY (emp_number) 
	REFERENCES tbl_employees (emp_number)
	ON DELETE CASCADE
)
;

--======================================================================
-- Check the structure of the Table
--======================================================================

SELECT
	*
FROM
	tbl_salaries
;

--======================================================================
-- Import data from the csv file "data_salaries" 
-- This is done via the Import/Export Feature
--======================================================================


--======================================================================
-- Check the data imported into the Table
-- Check # 1: Sanity check for the first 10 rows of data 
-- Check # 2: Verify that the row count matches the csv file (300,024)
--======================================================================

SELECT
	*
FROM
	tbl_salaries
LIMIT 10
;


SELECT
	COUNT(*)
FROM
	tbl_salaries
;



--======================================================================
--======================================================================
-- Create Table # 4: tbl_titles
-- The column "emp_number" has been designated as the Foreign Key.
-- This column references the column "emp_number" in the table "tbl_employees". 
-- The "ON DELETE CASCADE" clause has been added for referential integrity.
-- This Clause ensures that if:
-- a record in the parent table "tbl_employees" is deleted, 
-- then the corresponding records in this table will automatically be deleted.
--======================================================================
--======================================================================

DROP TABLE IF EXISTS tbl_titles;

CREATE TABLE "tbl_titles" 
(
    "emp_number" INT NOT NULL,
    "emp_title" VARCHAR(40) NOT NULL,
    "ttl_from_date" DATE NOT NULL,
    "ttl_to_date" DATE NOT NULL, 
	CONSTRAINT "tbl_titles_emp_number_FK" FOREIGN KEY (emp_number) 
	REFERENCES tbl_employees (emp_number)
	ON DELETE CASCADE
)
;

--======================================================================
-- Check the structure of the Table
--======================================================================

SELECT
	*
FROM
	tbl_titles
;

--======================================================================
-- Import data from the csv file "data_titles" 
-- This is done via the Import/Export Feature
--======================================================================


--======================================================================
-- Check the data imported into the Table
-- Check # 1: Sanity check for the first 10 rows of data 
-- Check # 2: Verify that the row count matches the csv file (443,308)
--======================================================================

SELECT
	*
FROM
	tbl_titles
LIMIT 10
;


SELECT
	COUNT(*)
FROM
	tbl_titles
;



--======================================================================
--======================================================================
-- Create Table # 5: tbl_department_employees
-- The columns "emp_number" and "dept_number" have been designated as the Foreign Keys.
-- The column "emp_number" references the column "emp_number" in the table "tbl_employees". 
-- The column "dept_number" references the column "dept_number" in the table "tbl_departments".
-- The "ON DELETE CASCADE" clause has been added for referential integrity.
-- This Clause ensures that if:
-- a record in either of the parent tables "tbl_employees" or "tbl_departments" is deleted, 
-- then the corresponding records in this table will automatically be deleted. 
--======================================================================
--======================================================================

DROP TABLE IF EXISTS tbl_department_employees;

CREATE TABLE "tbl_department_employees" 
(
    "emp_number" INT NOT NULL,
    "dept_number" VARCHAR(20) NOT NULL,
    "dept_emp_from_date" DATE NOT NULL,
    "dept_emp_to_date" DATE NOT NULL,
	CONSTRAINT "tbl_dept_emp_emp_number_FK" FOREIGN KEY (emp_number) 
	REFERENCES tbl_employees (emp_number)
	ON DELETE CASCADE, 
	CONSTRAINT "tbl_dept_emp_dept_number_FK" FOREIGN KEY (dept_number) 
	REFERENCES tbl_departments (dept_number)
	ON DELETE CASCADE
)
;

--======================================================================
-- Check the structure of the Table
--======================================================================

SELECT
	*
FROM
	tbl_department_employees
;

--======================================================================
-- Import data from the csv file "data_dept_emp" 
-- This is done via the Import/Export Feature
--======================================================================


--======================================================================
-- Check the data imported into the Table
-- Check # 1: Sanity check for the first 10 rows of data 
-- Check # 2: Verify that the row count matches the csv file (331,603)
--======================================================================

SELECT
	*
FROM
	tbl_department_employees
LIMIT 10
;


SELECT
	COUNT(*)
FROM
	tbl_department_employees
;



--======================================================================
--======================================================================
-- Create Table # 6: tbl_department_managers
-- The columns "emp_number" and "dept_number" have been designated as the Foreign Keys.
-- The column "emp_number" references the column "emp_number" in the table "tbl_employees". 
-- The column "dept_number" references the column "dept_number" in the table "tbl_departments".
-- The "ON DELETE CASCADE" clause has been added for referential integrity.
-- This Clause ensures that if:
-- a record in either of the parent tables "tbl_employees" or "tbl_departments" is deleted, 
-- then the corresponding records in this table will automatically be deleted. 
--======================================================================
--======================================================================

DROP TABLE IF EXISTS tbl_department_managers;

CREATE TABLE "tbl_department_managers" 
(
    "dept_number" VARCHAR(20) NOT NULL,
    "emp_number" INT NOT NULL,
    "dept_mgr_from_date" DATE NOT NULL,
    "dept_mgr_to_date" DATE NOT NULL,
	CONSTRAINT "tbl_dept_mgr_emp_number_FK" FOREIGN KEY (emp_number) 
	REFERENCES tbl_employees (emp_number)
	ON DELETE CASCADE, 
	CONSTRAINT "tbl_dept_mgr_dept_number_FK" FOREIGN KEY (dept_number) 
	REFERENCES tbl_departments (dept_number)
	ON DELETE CASCADE
)
;

--======================================================================
-- Check the structure of the Table
--======================================================================

SELECT
	*
FROM
	tbl_department_managers
;

--======================================================================
-- Import data from the csv file "data_dept_manager" 
-- This is done via the Import/Export Feature
--======================================================================


--======================================================================
-- Check the data imported into the Table
-- Check # 1: Sanity check for the first 10 rows of data 
-- Check # 2: Verify that the row count matches the csv file (24)
--======================================================================

SELECT
	*
FROM
	tbl_department_managers
LIMIT 10
;


SELECT
	COUNT(*)
FROM
	tbl_department_managers
;



--======================================================================
--======================================================================
-- This is the END of the "Data Engineering" SQL 
-- The "Data Analysis" SQL file is in the folder "03_Data_Analysis"
-- It is called "SQL_02_Data_Analysis.sql"
--======================================================================
--======================================================================



