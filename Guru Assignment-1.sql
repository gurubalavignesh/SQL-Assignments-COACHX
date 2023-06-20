CREATE TABLE Employee_Details
(
	EmpId			INT,
	FullName		VARCHAR(50),
	ManagerId		INT,
	DateOfJoining	DATE,
	City			VARCHAR(50),
);

INSERT INTO Employee_Details Values
(121 , 'John Snow' , 321 , '01/31/2019' , 'Toronto' ),
(321 , 'Walter White' , 986 , '01/30/2020' , 'California' ),
(421 , 'Kuldeep Rana' , 876 , '11/27/2019' , 'Toronto' );

SELECT * FROM Employee_Details;

CREATE TABLE Employee_Salary
(
	EmpId			INT,
	Project			VARCHAR(25),
	Salary			INT,
	Variable		INT,
);

INSERT INTO Employee_Salary Values
(121 , 'P1' , 8000 , 500 ),
(321 , 'P2' , 10000 , 1000),
(421 , 'P1' , 12000 , 0 );

SELECT * FROM Employee_Salary;

-->1). SQL Query to fetch records that are present in one table but not in another table.

SELECT * FROM Employee_Details d WHERE NOT EXISTS (SELECT * FROM Employee_Salary s WHERE s.EmpId=d.EmpId );


-->2). SQL query to fetch all the employees who are not working on any project.

SELECT E.EmpID , E.FullName, S.Project FROM Employee_Details E JOIN Employee_Salary S ON E.EmpId = S.EmpID WHERE S.Project IS NULL;

SELECT * FROM Employee_Salary WHERE Project IS NULL;

/*SELECT E.EmpID , E.FullName, S.Project FROM Employee_Details E JOIN Employee_Salary S ON E.EmpId = S.EmpID; */


--> 3). SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.

SELECT EmpID ,FullName, DateOfJoining FROM Employee_Details WHERE DATEPART(YYYY,DateOfJoining)=2020;


--> 4). Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.

SELECT * FROM Employee_Details d WHERE EXISTS (SELECT * FROM Employee_Salary s WHERE d.EmpId = s.EmpId); 

SELECT d.EmpId , d.FullName, s.Salary FROM Employee_Details d JOIN Employee_Salary s on d.EmpId = s.EmpId;


--> 5). Write an SQL query to fetch a project-wise count of employees.

SELECT Project , COUNT(*) Project FROM Employee_Salary GROUP BY Project;

--> 6). Fetch employee names and salaries even if the salary value is not present for the employee.

SELECT				d.EmpId , d.FullName, s.Salary 
FROM				Employee_Details d 
LEFT OUTER JOIN		Employee_Salary s on d.EmpId = s.EmpId;

--> 7). Write an SQL query to fetch all the Employees who are also managers.

SELECT	Manager.EmpId,
		Manager.FullName AS EmployeeName,
		Employee.EmpId AS ReporteeId, 
		Employee.FullName AS ReporteeName,
		Employee.ManagerId AS ReporteeManagerId
		
	
FROM	Employee_Details Manager
JOIN	Employee_Details Employee
ON		Employee.ManagerId=Manager.EmpId;

SELECT * FROM Employee_Details;

--> 8). Write an SQL query to fetch duplicate records from EmployeeDetails.

SELECT		EmpId,FullName,ManagerId,DateOfJoining , City , COUNT(*) 
FROM		Employee_Details
GROUP BY	EmpId,FullName,ManagerId,DateOfJoining , City
HAVING		COUNT(*) >1 ;

-->9). Write an SQL query to fetch only odd rows from the table.

/* SELECT *, Row_Number() OVER (ORDER BY EmpId) AS RowNumber
    FROM Employee_Details; */

SELECT *
FROM (
    SELECT *, Row_Number() OVER(ORDER BY EmpId) AS RowNumber
    FROM Employee_Details
) E
WHERE E.RowNumber % 2 !=0;

-->10). Write a query to find the 3rd highest salary from a table without top or limit keyword.

SELECT Salary
FROM Employee_Salary Emp1
WHERE 2 = (
                SELECT COUNT( DISTINCT ( Emp2.Salary ) )
                FROM Employee_Salary Emp2
                WHERE Emp2.Salary > Emp1.Salary
            );

SELECT * FROM Employee_Salary;





