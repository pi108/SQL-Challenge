--=====================================================================
-- TASK # 1 (AS SPECIFIED IN THE HW INSTRUCTIONS):
-- List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.
--=====================================================================

SELECT 
	tbl_employees.emp_number, 
	tbl_employees.emp_last_name, 
	tbl_employees.emp_first_name, 
	tbl_employees.emp_gender, 
	tbl_salaries.emp_salary
FROM 
	tbl_employees
JOIN 
	tbl_salaries
ON 
	tbl_employees.emp_number = tbl_salaries.emp_number
;

--=====================================================================
-- TASK # 1 CHECK (NOT SPECIFIED IN THE HW INSTRUCTIONS)
-- VERIFY THAT THE ROW COUNT IS CORRECT: SHOULD BE 300,024
-- THIS IS BECAUSE THERE ARE 300,024 ROWS IN BOTH THE TABLES 
--=====================================================================

SELECT 
	COUNT(tbl_employees.emp_number), 
	COUNT(tbl_employees.emp_last_name), 
	COUNT(tbl_employees.emp_first_name), 
	COUNT(tbl_employees.emp_gender), 
	COUNT(tbl_salaries.emp_salary)
FROM
	tbl_employees
JOIN 
	tbl_salaries
ON 
	tbl_employees.emp_number = tbl_salaries.emp_number
;



--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- END OF TASK # 1
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX



--=====================================================================
-- TASK # 2 (AS SPECIFIED IN THE HW INSTRUCTIONS):
-- List employees who were hired in 1986.
--=====================================================================

SELECT 
	tbl_employees.emp_last_name, 
	tbl_employees.emp_first_name, 
	tbl_employees.emp_hire_date
FROM 
	tbl_employees
WHERE
	tbl_employees.emp_hire_date BETWEEN '1986-01-01' AND '1986-12-31'
;

--=====================================================================
-- TASK # 2 CHECK (NOT SPECIFIED IN THE HW INSTRUCTIONS)
-- VERIFY THAT THE MIN value returned for the hire_date = 01/01/1986
-- VERIFY THAT THE MAX value returned for the hire_date = 12/31/1986 
--=====================================================================

SELECT 
	MIN(tbl_employees.emp_hire_date) AS "MIN_HIRE_DATE", 
	MAX(tbl_employees.emp_hire_date) AS "MAX_HIRE_DATE"
FROM 
	tbl_employees
WHERE
	tbl_employees.emp_hire_date BETWEEN '1986-01-01' AND '1986-12-31'
;



--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- END OF TASK # 2
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX



--=====================================================================
-- TASK # 3 (AS SPECIFIED IN THE HW INSTRUCTIONS):
-- List the manager of each department with the following information:  
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
--=====================================================================

SELECT 
	tbl_departments.dept_number, 
	tbl_departments.dept_name, 
	tbl_department_managers.emp_number, 
	tbl_employees.emp_last_name, 
	tbl_employees.emp_first_name, 
	tbl_department_managers.dept_mgr_from_date, 
	tbl_department_managers.dept_mgr_to_date
FROM 
	tbl_departments
JOIN tbl_department_managers ON 
	tbl_departments.dept_number = tbl_department_managers.dept_number
JOIN tbl_employees ON 
	tbl_employees.emp_number = tbl_department_managers.emp_number
;

--=====================================================================
-- TASK # 3 CHECK (NOT SPECIFIED IN THE HW INSTRUCTIONS)
-- VERIFY THAT THE ROW COUNT IS CORRECT: SHOULD BE 24
-- THIS IS BECAUSE THERE ARE 24 ROWS IN DEPARTMENT_MANAGER TABLE
--=====================================================================

SELECT 
	COUNT(tbl_departments.dept_number), 
	COUNT(tbl_departments.dept_name), 
	COUNT(tbl_department_managers.emp_number), 
	COUNT(tbl_employees.emp_last_name), 
	COUNT(tbl_employees.emp_first_name), 
	COUNT(tbl_department_managers.dept_mgr_from_date), 
	COUNT(tbl_department_managers.dept_mgr_to_date)
FROM 
	tbl_departments
JOIN tbl_department_managers ON 
	tbl_departments.dept_number = tbl_department_managers.dept_number
JOIN tbl_employees ON 
	tbl_employees.emp_number = tbl_department_managers.emp_number
;



--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- END OF TASK # 3
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX



--=====================================================================
-- TASK # 4 (AS SPECIFIED IN THE HW INSTRUCTIONS):
-- List the department of each employee with the following information:   
-- employee number, last name, first name, and department name. 
--=====================================================================

SELECT 
	tbl_department_employees.emp_number, 
	tbl_employees.emp_last_name, 
	tbl_employees.emp_first_name, 
	tbl_departments.dept_name
FROM 
	tbl_department_employees
JOIN tbl_departments ON 
	tbl_departments.dept_number = tbl_department_employees.dept_number
JOIN tbl_employees ON 
	tbl_employees.emp_number = tbl_department_employees.emp_number
;

--=====================================================================
-- TASK # 4 CHECK (NOT SPECIFIED IN THE HW INSTRUCTIONS)
-- VERIFY THAT THE ROW COUNT IS CORRECT: SHOULD BE 331,603
-- THIS IS BECAUSE THERE ARE 331,603 ROWS IN THE DEPARTMENT_EMPLOYEES TABLE 
--=====================================================================

SELECT 
	COUNT(tbl_department_employees.emp_number), 
	COUNT(tbl_employees.emp_last_name), 
	COUNT(tbl_employees.emp_first_name), 
	COUNT(tbl_departments.dept_name)
FROM 
	tbl_department_employees
JOIN tbl_departments ON 
	tbl_departments.dept_number = tbl_department_employees.dept_number
JOIN tbl_employees ON 
	tbl_employees.emp_number = tbl_department_employees.emp_number
;

--=====================================================================
-- TASK # 4 SQL-ENHANCED (NOT SPECIFIED IN THE HW INSTRUCTIONS)
-- NOTE THAT THE ROW COUNT OF THE DEPT EMPLOYEES TABLE IS 331,603
-- THIS MATCHES THE ROW COUNT IN THE SQL STATEMENT ABOVE - WHICH IS GOOD 
-- HOWEVER, THERE ARE ONLY 300,024 EMPLOYEES IN THE EMPLOYEE TABLE
-- THIS IS EXPLAINED BY SOME EMPLOYEES WORKING IN DIFF DEPTS OVER TIME
-- BUT THE SQL SPECIFIED IN THE HW DID NOT ASK FOR THE TIME PERIODS
-- WITHOUT THE TIME PERIOD, THE RESULTS CAN BE CONFUSING, 
-- SINCE SOME EMPLOYEES WILL SHOW UP IM MULTIPLE DEPTS
-- SO I HAVE ADDED THE TIME PERIODS TO THE SQL SPECIFIED IN THE HW
-- THE ENHANCED SQL (WITH THE TIME PERIOODS) IS BELOW
--=====================================================================

SELECT 
	tbl_department_employees.emp_number, 
	tbl_employees.emp_last_name, 
	tbl_employees.emp_first_name, 
	tbl_departments.dept_name,
	tbl_department_employees.dept_emp_from_date, 
	tbl_department_employees.dept_emp_to_date
FROM 
	tbl_department_employees
JOIN tbl_departments ON 
	tbl_departments.dept_number = tbl_department_employees.dept_number
JOIN tbl_employees ON 
	tbl_employees.emp_number = tbl_department_employees.emp_number
;

--=====================================================================
-- TASK # 4 SQL-ENHANCED CHECK (NOT SPECIFIED IN THE HW INSTRUCTIONS)
-- VERIFY THAT THE ROW COUNT IS CORRECT: SHOULD BE 331,603
-- THIS IS BECAUSE THERE ARE 331,603 ROWS IN THE DEPARTMENT_EMPLOYEES TABLE 
--=====================================================================

SELECT 
	COUNT(tbl_department_employees.emp_number), 
	COUNT(tbl_employees.emp_last_name), 
	COUNT(tbl_employees.emp_first_name), 
	COUNT(tbl_departments.dept_name),
	COUNT(tbl_department_employees.dept_emp_from_date),
	COUNT(tbl_department_employees.dept_emp_to_date)
FROM 
	tbl_department_employees
JOIN tbl_departments ON 
	tbl_departments.dept_number = tbl_department_employees.dept_number
JOIN tbl_employees ON 
	tbl_employees.emp_number = tbl_department_employees.emp_number
;



--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- END OF TASK # 4
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX



--=====================================================================
-- TASK # 5 (AS SPECIFIED IN THE HW INSTRUCTIONS):
-- List all employees whose first name is "Hercules"    
-- and last names begin with "B.". 
--=====================================================================

SELECT 
	tbl_employees.emp_last_name, 
	tbl_employees.emp_first_name 
FROM 
	tbl_employees
WHERE
	tbl_employees.emp_first_name = 'Hercules' 
AND
	tbl_employees.emp_last_name LIKE 'B%'
;



--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- END OF TASK # 5
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX



--=====================================================================
-- TASK # 6 (AS SPECIFIED IN THE HW INSTRUCTIONS):
-- List all employees in the Sales department, including their:   
-- employee number, last name, first name, and department name. 
--=====================================================================

SELECT 
	tbl_department_employees.emp_number, 
	tbl_employees.emp_last_name, 
	tbl_employees.emp_first_name, 
	tbl_departments.dept_name
FROM 
	tbl_department_employees
JOIN tbl_departments ON 
	tbl_departments.dept_number = tbl_department_employees.dept_number
JOIN tbl_employees ON 
	tbl_employees.emp_number = tbl_department_employees.emp_number
WHERE
	tbl_departments.dept_name = 'Sales'
;

--=====================================================================
-- TASK # 6 CHECK (NOT SPECIFIED IN THE HW INSTRUCTIONS)
-- VERIFY THAT THE ROW COUNT IS CORRECT: SHOULD BE 52,245
-- THIS IS BECAUSE THERE ARE 52,245 ROWS FOR SALES IN THE DEPARTMENT_EMPLOYEES TABLE
--=====================================================================

SELECT 
	COUNT(tbl_department_employees.emp_number), 
	COUNT(tbl_employees.emp_last_name), 
	COUNT(tbl_employees.emp_first_name), 
	COUNT(tbl_departments.dept_name)
FROM 
	tbl_department_employees
JOIN tbl_departments ON 
	tbl_departments.dept_number = tbl_department_employees.dept_number
JOIN tbl_employees ON 
	tbl_employees.emp_number = tbl_department_employees.emp_number
WHERE
	tbl_departments.dept_name = 'Sales'
;



--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- END OF TASK # 6
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX



--=====================================================================
-- TASK # 7 (AS SPECIFIED IN THE HW INSTRUCTIONS):
-- List all employees in the Sales and Development departments, including their:   
-- employee number, last name, first name, and department name. 
--=====================================================================

SELECT 
	tbl_department_employees.emp_number, 
	tbl_employees.emp_last_name, 
	tbl_employees.emp_first_name, 
	tbl_departments.dept_name
FROM 
	tbl_department_employees
JOIN tbl_departments ON 
	tbl_departments.dept_number = tbl_department_employees.dept_number
JOIN tbl_employees ON 
	tbl_employees.emp_number = tbl_department_employees.emp_number
WHERE
	tbl_departments.dept_name = 'Sales' 
OR
	tbl_departments.dept_name = 'Development' 
;

--=====================================================================
-- TASK # 7 CHECK (NOT SPECIFIED IN THE HW INSTRUCTIONS)
-- VERIFY THAT THE ROW COUNT IS CORRECT: SHOULD BE 137,952
-- THIS IS BECAUSE THERE ARE:
-- 52,245 ROWS FOR SALES IN THE DEPARTMENT_EMPLOYEES TABLE
-- 85,707 ROWS FOR DEVELOPMENT IN THE DEPARTMENT_EMPLOYEES TABLE
-- 52,245 + 85,707 = 137,952
--=====================================================================

SELECT 
	COUNT(tbl_department_employees.emp_number), 
	COUNT(tbl_employees.emp_last_name), 
	COUNT(tbl_employees.emp_first_name), 
	COUNT(tbl_departments.dept_name)
FROM 
	tbl_department_employees
JOIN tbl_departments ON 
	tbl_departments.dept_number = tbl_department_employees.dept_number
JOIN tbl_employees ON 
	tbl_employees.emp_number = tbl_department_employees.emp_number
WHERE
	tbl_departments.dept_name = 'Sales'
OR
	tbl_departments.dept_name = 'Development' 
;



--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- END OF TASK # 7
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX



--=====================================================================
-- TASK # 8 (AS SPECIFIED IN THE HW INSTRUCTIONS):
-- In descending order, list the frequency count of employee last names,   
-- i.e., how many employees share each last name. 
--=====================================================================

SELECT 
	tbl_employees.emp_last_name, 
	count(tbl_employees.emp_last_name) AS "FREQUENCY_COUNT"
FROM 
	tbl_employees
GROUP BY
	tbl_employees.emp_last_name
ORDER BY
	count(tbl_employees.emp_last_name) DESC
;



--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- END OF TASK # 8
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX






--=====================================================================
-- EPILOGUE:
-- Evidence in hand, you march into your boss's office and present the visualization.
-- With a sly grin, your boss thanks you for your work. 
-- On your way out of the office, you hear the words, "Search your ID number." 
-- You look down at your badge to see that your employee ID number is 499942. 
-- =====================================================================
-- The SQL below retrieves data for employee number 499942.
-- The result shows first_name = April, and last_name = Foolsday.
-- The hire_date = 1997-02-10, but the salary_from_date = 1998-03-28.
-- Based on this, it is clear that this is a fictitious dataset.
--=====================================================================

SELECT
	tbl_employees.emp_number,
	tbl_employees.emp_first_name,
	tbl_employees.emp_last_name,
	tbl_employees.emp_hire_date,
	tbl_salaries.emp_salary,
	tbl_salaries.sal_from_date,
	tbl_salaries.sal_to_date,
	tbl_titles.emp_title
FROM
	tbl_employees
JOIN
	tbl_salaries
ON
	tbl_salaries.emp_number = tbl_employees.emp_number
JOIN
	tbl_titles
ON
	tbl_titles.emp_number = tbl_employees.emp_number
WHERE	
	tbl_employees.emp_number = 499942


--======================================================================
--======================================================================
-- This is the END of the "Data Analysis" SQL file. 
-- We continued our analysis of the data using Pandas and Jupyter Notebook.
-- The Jupyter Notebook File is called "JPYNB_01_Data_Analysis".
-- It can be found in the folder "04_Bonus".
--======================================================================
--======================================================================

