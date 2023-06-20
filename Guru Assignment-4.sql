

--> 1). Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field.

SELECT FullName , LEN(FullName) , REPLACE(FullName,'n','') FROM Employee_Details;

SELECT FullName , LEN(FullName) , REPLACE(FullName,'n','') , LEN(FullName) - LEN(REPLACE(FullName,'n','')) AS TotalChar_Occurrence  FROM Employee_Details;


--> 2). Write an SQL query to update the employee names by removing leading and trailing spaces.

UPDATE Employee_Details SET FullName = LTRIM(RTRIM(FullName));


--> 3). Fetch all the employees who are not working on any project.

SELECT * FROM Employee_Salary WHERE Project IS NULL;


--> 4). Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.

SELECT		d.EmpId, d.FullName, s.salary FROM	Employee_Details d 
JOIN											Employee_Salary s  
ON			d.EmpId= s.EmpId 
WHERE		s.Salary BETWEEN  5000 AND 10000;

--> 5). Write an SQL query to find the current date-time.

SELECT GETDATE();


--> 6). Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020.

SELECT EmpID ,FullName, DateOfJoining FROM Employee_Details WHERE DATEPART(YYYY,DateOfJoining)=2020;


--> 7). Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table.

SELECT * FROM Employee_Details d WHERE EXISTS (SELECT * FROM Employee_Salary s WHERE d.EmpId = s.EmpId); 

SELECT d.EmpId , d.FullName, s.Salary FROM	Employee_Details d 
JOIN										Employee_Salary s 
ON				d.EmpId = s.EmpId;


--> 8). Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order.

SELECT Project , COUNT(*) Project FROM Employee_Salary 
GROUP BY Project 
ORDER BY COUNT(*)DESC;


--> 9). Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.

SELECT d.FullName , s.Salary	FROM	Employee_Details d 
LEFT JOIN								Employee_Salary s
ON			d.EmpId = s.EmpId;


--> 10). Write an SQL query to join 3 tables.

 /* SELECT column1, column2
	FROM Table1
	JOIN Table2 ON Table1.Column3 = Table2.Column3
	JOIN Table3 ON Table1.Column4 = Table3.Column4;
 */

