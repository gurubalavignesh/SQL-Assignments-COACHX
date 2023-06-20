
--> 1). Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.

SELECT EmpId FROM Employee_Details
UNION 
SELECT EmpId FROM Employee_Salary;


--> 2). Write an SQL query to fetch common records between two tables.

SELECT EmpId FROM Employee_Details
INTERSECT 
SELECT EmpId FROM Employee_Salary;

--> 3). Write an SQL query to fetch records that are present in one table but not in another table.

SELECT * FROM Employee_Details d WHERE NOT EXISTS (SELECT * FROM Employee_Salary s WHERE d.EmpId = s.EmpId);


--> 4). Write an SQL query to fetch the EmpIds that are present in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary.

SELECT		EmpId FROM Employee_Details 
WHERE		EmpId IN 
(SELECT		EmpId FROM Employee_Salary);

--> 5). Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.

SELECT		EmpId FROM Employee_Details 
WHERE		EmpId NOT IN 
(SELECT		EmpId FROM Employee_Salary);

--> 6). Write an SQL query to fetch the employee’s full names and replace the space.

SELECT REPLACE(FullName,' ', '-') FROM Employee_Details;

--> 7). Write an SQL query to fetch the position of a given character(s) in a field.

SELECT FullName FROM Employee_Details;

SELECT CHARINDEX('W',FullName, 1) FROM Employee_Details;


--> 8). Write an SQL query to display both the EmpId and ManagerId together.

SELECT CONCAT(EmpId,' ',ManagerId) AS NewEmpID FROM Employee_Details;


--> 9). Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table.

SELECT SUBSTRING(FullName,1,CHARINDEX(' ',FullName)) FROM Employee_Details;


--> 10). Write an SQL query to uppercase the name of the employee and lowercase the city values.

SELECT UPPER(FullName) , LOWER(City) FROM Employee_Details;


