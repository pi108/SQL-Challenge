# SQL-Challenge
# An Analysis of “Pewlett-Hackard” Employees Data using PostgreSQL

## This repository contains a folder called SQL-Challenge which contains the following sub-folders:
00_Resources
01_Data_Modeling
02_Data_Engineering
03_Data_Analysis
04_Bonus_Analysis

### 00_Resources:
This sub-folder contains the 6 csv files which were used for this analysis:
1.	data_departments.csv
2.	data_employees.csv
3.	data_salaries.csv
4.	data_titles.csv
5.	data_dept_manager.csv
6.	data_employees.csv
These 6 csv files were loaded into 6 separate tables in a PostgreSQL Database called “DB_Pewlett_Hackard_Employees”.

### 01_Data_Modeling:
This sub-folder contains the following:
1.	An ERD (Entity Relationship Diagram) that visually shows the contents of the 6 Tables and how they are connected in the PostgreSQL DataBase “DB_Pewlett_Hackard_Employees”.
2.	A Word Document which contains the ERD and a description of the logic behind the Primary Keys and the Foreign Keys that were used when creating and connecting the 6 Tables.

### 02_Data_Engineering:
This sub-folder contains the following SQL file:
1.	SQL_01_Data_Engineering.sql
This file contains the SQL used to create the 6 Tables in the PostgreSQL DataBase “DB_Pewlett_Hackard_Employees.
After the 6 tables were created, data was imported into each of the 6 tables from the 6 individual csv files respectively.
 
### 03_Data_Analysis:
This sub-folder contains the following SQL file:
1.	SQL_02_Data_Analysis.sql
This file contains the SQL that was used to analyze the data in the PostgreSQL  DataBase “DB_Pewlett_Hackard_Employees”.

### 04_Bonus_Analysis:
This sub-folder contains the following:
1.	JPYNB_01_Data_Analysis.ipynb
This Jupyter Notebook File establishes a connection between Pandas and the PostgreSQL DataBase “DB_Pewlett_Hackard_Employees”. 
The Python Library Pandas is then used to create DataFrames and extract data from the PostgreSQL DataBase for analysis.
The Python Library Matplotlib is also used to create Charts and Histograms.
2.Output Folder:
This Folder contains a Bar Chart that shows the Average Salary by Employee Title.
This Folder also contains 8 Salary Histograms – one Histogram for all the Employee Titles combined together, and then one Histogram for each of the 7 Employee Titles.


# Conclusions:
Based on our analysis, we conclude that the dataset provided to us is a fictitious dataset due to the following findings:
## Unintuitive / Unrealistic Salary File: 
In the Data Modeling stage, when we were creating the ERD (Entity Relationship Diagram), we discovered that:
1.	There is only one record per employee in the salaries table implying that the salary had not changed over time for any of the employees. For example, if you look at Employee # 10007. The employee was hired on 02/10/1989. The employee's title was Staff from 02/10/1989 to 02/11/1996, and then Senior Staff from 02/11/1996 onwards. However, in the salary table there is only one record for this employee for a salary of $ 56,724 and the time period is specified as 02/10/1989 to 02/10/1990. There are no other records for this employee in the salary table, implying that either the employee was only paid salary for the time-period 02/10/1989 to 02/10/1990 and not paid for any time worked thereafter (which is extremely unrealistic), OR that the dataset is an incomplete / fictitious dataset. 
## Fictitious Data related to Employee Number 499942:
In the Data Analysis stage, the SQL Analysis file (“SQL_01_Analysis”), revealed that for employee number 499942:
1. The first name was "April", and the last_name was "Foolsday". 
2. The hire_date is 1997-02-10, but the salary from_date is 1998-03-28, implying that this employee was not paid any salary for more than a year after the employee’s hire date. 
## Unintuitive / Unrealistic Average Salary Data: 
In the Data Analysis stage, the Jupyter Notebook Analysis file (“JPYNB_01_Data_Analysis”) revealed  that:
1.	The Average Salary for the Employee Title = "Staff" is higher than that of the Employee Title = "Manager". This is unintuitive, because the Average Salary for the Employee Title = "Manager" should be higher than that of the Employee Title = "Staff".
2.	The Average Salary for the Employee Title = "Staff" is almost identical to that of the Employee Title = "Senior Staff". This is unintuitive, because the Average Salary for the Employee Title = "Senior Staff" should be much higher than that of the Employee Title = "Staff".
3.	The Average Salary for the Employee Title = "Engineer" is higher than that of the Employee Title = "Senior Engineer". This is unintuitive, because the Average Salary for the Employee Title = "Senior Engineer" should be much higher than that of the Employee Title = "Engineer".
## Unintuitive / Unrealistic Proportions within the Category of Engineers: 
In the Data Analysis stage, the Jupyter Notebook Analysis file (“JPYNB_01_Data_Analysis”) also revealed  that:
1.	There are only 15,128 assistant engineers, but there are 115,003 engineers. This is unintuitive, because typically you should have more assistant engineers (subordinates) than engineers (superiors). 
## Unintuitive / Unrealistic Salary Histograms that look almost identical in shape across multiple Employee Titles:
Finally, in the Data Analysis stage, the Jupyter Notebook Analysis file (“JPYNB_01_Data_Analysis”) revealed  that:
1.	The Salary Histogram looks almost identical in shape for the Employee Titles Assistant Engineer, Engineer, and Senior Engineer. This is very suspicious and highly unrealistic.    
2.	The Salary Histogram looks almost identical in shape for the Employee Titles Staff and Senior Staff. This is very suspicious and highly unrealistic.    







