USE hr_database;
SELECT * FROM employee_attrition
LIMIT 10;
CREATE TABLE employees( Age INT,
Attrition varchar(10),
BusinessTravel VARCHAR(50),
DailyRate INT,
Department varchar(50),
DistanceFromHome INT,
Education INT,
EducationField Varchar (50),
EmployeeCount INT,
EmployeeNumber INT,
EnvironmentSatisfaction INT,
Gender varchar (10),
JobRole varchar(50),
MaritalStatus varchar(20),
MonthlyIncome INT,
OverTime varchar(10)
);
select* FROM employees
WHERE Attrition IS NULL;
SELECT COUNT(*) AS Employees
FROM employees_attrition ; 
SELECT *
FROM employee_attrition
LIMIT 5;
SELECT COUNT(*) AS Total Employees
FROM employee_attrition;
Select COUNT(*)
FROM employee_attrition;
SELECT COUNT(*) AS TotalEmployees
FROM employee_attrition;
select COUNT(*) AS TotalEmployees,
SUM(CASE WHEN Attrition = 'YES' THEN 1 ELSE 0 
END) AS AttritionCount,
ROUND(SUM(CASE WHEN Attrition = 'YES' THEN 1 
ELSE 0 END)* 100.0/COUNT(*),2) AS AttritionRate 
FROM employee_attrition;
SELECT Department,
COUNT(*) AS AttritionCount
FROM employee_attrition
WHERE Attrition = 'YES'
GROUP BY Department;
SELECT JobRole,
COUNT(*) AS AttritionCount
FROM employee_attrition
WHERE Attrition ='YES'
GROUP BY JobRole
order by AttritionCount DESC;
SELECT OverTime,
COUNT(*) AS AttritionCount
FROM employee_attrition
WHERE Attrition = 'YES'
group by OverTime;
SELECT CASE WHEN MonthlyIncome < 5000 THEN 'LOW'
WHEN MonthlyIncome BETWEEN 5000 AND 10000
THEN 'Medium' ELSE 'High' 
END AS IncomeBand,
COUNT(*) AS AttritionCount 
FROM employee_attrition
WHERE Attrition = 'YES'
group by IncomeBand;
select CASE WHEN Age < 30 THEN 'Young' when Age between 30 and 40 THEN 'Mid' ELSE 'Senior'
END AS AgeGroup,
Count(*) AS AttritionCount
from employee_attrition WHERE Attrition = 'YES' 
group by AgeGroup;
CREATE OR REPLACE VIEW vw_attrition_jobrole AS 
Select JobRole,
count(*) AS AttritionCount FROM employee_attrition WHERE Attrition = 'YES'
group by JobRole;
CREATE OR REPLACE VIEW vw_attrition_overtime AS SELECT OverTime, 
COUNT(*) AS AttritionCount FROM employee_attrition WHERE Attrition = 'YES'
group by OverTime;
CREATE OR REPLACE VIEW  vw_income_band AS SELECT CASE 
WHEN MonthlyIncome < 5000 THEN 'LOW' WHEN MonthlyIncome BETWEEN 5000  AND 10000 THEN 'MEDIUM' ELSE 'HIGH'
END AS IncomeBand, 
COUNT(*) AS AttritionCount
FROM employee_attrition WHERE Attrition = 'YES' 
GROUP BY 
CASE WHEN  MonthlyIncome < 5000 THEN 'LOW' WHEN MonthlyIncome BETWEEN 5000  AND 10000 THEN 'MEDIUM' ELSE 'HIGH'
END;
CREATE OR REPLACE VIEW vw_age_group AS SELECT CASE
WHEN Age < 30 THEN 'Young' when Age BETWEEN 30 AND 40 THEN 'Mid' ELSE 'Senior' 
END AS Age_group,
count(*) AS AttritionCount 
FROM employee_attrition WHERE Attrition = 'YES'
GROUP BY CASE WHEN Age < 30 THEN 'Young' when Age BETWEEN 30 AND 40 THEN 'Mid' ELSE 'Senior' 
END;
CREATE VIEW vw_attrition_by_dept AS 
SELECT Department AS DepartmentName,
Count(*) As AttritionCount FROM employee_attrition
WHERE Attrition = 'YES' 
GROUP BY Department;
Select * FROM vw_age_group;






