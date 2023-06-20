

CREATE TABLE EmployeeInfo 
(
	EmpID		INT,
	EmpFname	VARCHAR(50),
	EmpLname	VARCHAR(50),
	Department	VARCHAR(25),
	Project		VARCHAR(5),
	Address		TEXT,
	DOB			DATE,
	Gender		CHAR(1),
);

INSERT INTO EmployeeInfo VALUES 
(1 , 'Sanjay' , 'Mehra' , 'HR' , 'P1', 'Hyderabad(HYD)' ,'1976/12/01' , 'M'),
(2 , 'Ananya' , 'Mishra' , 'Admin' , 'P2', 'Delhi(DEL)' , '1968/05/02' , 'F'),
(3 , 'Rohan' , 'Diwan' , 'Account' , 'P3', 'Mumbai(BOM)' , '1980/01/01' , 'M'),
(4 , 'Sonia' , 'Kulkarni' , 'HR' , 'P1', 'Hyderabad(HYD)' , '1992/05/02' , 'F'),
(5 , 'Ankit' , 'Kapoor' , 'Admin' , 'P2', 'Delhi(DEL)' , '1994/07/03' , 'M');

SELECT * FROM EmployeeInfo;


CREATE TABLE EmployeePosition
(
	EmpID			INT,
	EmpPosition		VARCHAR(50),
	DateOfJoining	DATE,
	Salary			INT,
);

INSERT INTO EmployeePosition VALUES 
(1 , 'Manager' , '2022/05/01' , 500000),
(2 , 'Executive' ,  '2022/05/02' , 75000),
(3 , 'Manager' , '2022/05/01' , 90000),
(2 , 'Lead' ,  '2022/05/02' , 85000),
(1 , 'Executive' , '2022/05/01' , 300000);

SELECT * FROM EmployeePosition;


--> 1). Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.

SELECT UPPER(EmpFname) AS EmpName FROM EmployeeInfo;


--> 2). Write a query to fetch the number of employees working in the department ‘HR’.

SELECT COUNT (*) No_Of_HR_Employees FROM EmployeeInfo WHERE Department = 'HR';


--> 3). Write a query to get the current date.

SELECT GETDATE() CurrentDateTime;


--> 4). Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.

SELECT SUBSTRING(EmpLname,1,4) FROM EmployeeInfo;


--> 5). Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.

SELECT SUBSTRING(Address,1,CHARINDEX('(', Address)-1) FROM EmployeeInfo;

SELECT * FROM EmployeeInfo;


--> 6). Write a query to create a new table that consists of data and structure copied from the other table.

SELECT * INTO Employee_Data FROM EmployeeInfo;

SELECT * FROM Employee_Data;


--> 7). Write sql query to find all the employees whose salary is between 50000 to 100000.

SELECT I.EmpID, CONCAT(I.EmpFname,' ',I.EmpLname) AS EmpName , I.Department , I.Project , P.Salary FROM EmployeeInfo I 
JOIN																									EmployeePosition P 
ON																										I.EmpID = P.EmpID
WHERE																									P.Salary BETWEEN 50000 AND 100000;

SELECT * FROM EmployeeInfo ;
SELECT * FROM EmployeePosition;


--> 8). Write a query to find the names of employees that begin with ‘S’.

SELECT CONCAT(EmpFname,' ',EmpLname) AS EmpName  FROM EmployeeInfo WHERE EmpFname LIKE 'S%';

SELECT * FROM EmployeeInfo ;


--> 9). Write a query to fetch top N records.

SELECT TOP(4) * FROM EmployeePosition ORDER BY Salary DESC;


--> 10). Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.

SELECT CONCAT(EmpFname,' ',EmpLname) AS FullName  FROM EmployeeInfo;


--> 11). Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender.

SELECT * FROM EmployeeInfo;

SELECT Gender ,COUNT(*) Count_Of_Employees FROM EmployeeInfo WHERE DOB BETWEEN '1970-05-02' AND '1975-12-31' GROUP BY Gender; 


--> 12). Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.

SELECT * FROM EmployeeInfo ORDER BY EmpLname DESC, Department;


--> 13). Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.

SELECT * FROM EmployeeInfo WHERE EmpLname LIKE '____A';


--> 14). Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.

SELECT * FROM EmployeeInfo WHERE EmpFname NOT IN ( 'Sanjay' , 'Sonia');


--> 15). Write a query to fetch details of employees with the address as “DELHI(DEL)”.

SELECT * FROM EmployeeInfo WHERE Address LIKE 'DELHI(DEL)%';


--> 16). Write a query to fetch all employees who also hold the managerial position.

SELECT E.EmpID, CONCAT(E.EmpFname,' ', E.EmpLname) EmpName, P.EmpPosition 
FROM															EmployeeInfo E
INNER JOIN														EmployeePosition P
ON																E.EmpID = P.EmpID
AND																P.EmpPosition IN ('Manager');


--> 17). Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.

SELECT COUNT(EmpID) EmpCount, Department FROM EmployeeInfo GROUP BY Department ORDER BY EmpCount ASC;


--> 18). Write a query to calculate the even and odd records from a table.

SELECT * FROM (SELECT * , ROW_NUMBER() OVER(ORDER BY EmpID) AS Rownumber FROM EmployeeInfo)E WHERE E.Rownumber %2 !=0;

SELECT * FROM (SELECT * , ROW_NUMBER() OVER(ORDER BY EmpID) AS Rownumber FROM EmployeeInfo)E WHERE E.Rownumber %2 =0;


--> 19). Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.


SELECT * FROM EmployeeInfo I WHERE EXISTS (SELECT * FROM EmployeePosition P WHERE I.EmpID= P.EmpID);


--> 20). Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.

SELECT * FROM EmployeePosition;



/*SELECT DISTINCT Salary FROM EmployeePosition P1 WHERE EXISTS (SELECT COUNT(DISTINCT Salary) FROM EmployeePosition P2);

SELECT DISTINCT Salary FROM EmployeePosition P1 WHERE EXISTS (SELECT COUNT(DISTINCT Salary) FROM EmployeePosition P2 WHERE P1.Salary>= P2.Salary);

SELECT DISTINCT Salary FROM EmployeePosition P1 WHERE EXISTS (SELECT COUNT(DISTINCT Salary) FROM EmployeePosition P2 WHERE P1.Salary<= P2.Salary);*/

SELECT DISTINCT Salary FROM EmployeePosition P1 
WHERE 2>= (SELECT COUNT(DISTINCT Salary) FROM EmployeePosition P2 WHERE P1.Salary>= P2.Salary);

SELECT DISTINCT Salary FROM EmployeePosition P1 
WHERE 2>= (SELECT COUNT(DISTINCT Salary) FROM EmployeePosition P2 WHERE P1.Salary<= P2.Salary) 
ORDER BY P1.Salary DESC;


--> 21). Write a query to find the Nth highest salary from the table without using TOP/limit keyword.

/* SELECT DISTINCT Salary FROM EmployeePosition P1 
WHERE N-1>= (SELECT COUNT(DISTINCT Salary) FROM EmployeePosition P2 WHERE P1.Salary<= P2.Salary) 
ORDER BY P1.Salary DESC; */


--> 22). Write a query to retrieve duplicate records from a table.

SELECT EmpID, EmpFname , Department , COUNT(*) CountOfRows FROM EmployeeInfo 
GROUP BY EmpID, EmpFname , Department
HAVING COUNT(*)>1;


--> 23). Write a query to retrieve the list of employees working in the same department.

SELECT  E1.EmpID, CONCAT(E1.EmpFname,' ', E1.EmpLname) , E1.Department	FROM			EmployeeInfo E1 
JOIN																					EmployeeInfo E2 
ON																						E1.Department = E2.Department 
WHERE																					E1.EmpID != E2.EmpID;

SELECT DISTINCT E1.EmpID, CONCAT(E1.EmpFname,' ',E1.EmpLname), E1.Department FROM		EmployeeInfo E1 ,EmployeeInfo E2
WHERE																					E1.Department = E2.Department 
AND																						E1.EmpID != E2.EmpID;


SELECT * FROM EmployeeInfo;


--> 24). Write a query to retrieve the last 3 records from the EmployeeInfo table.


SELECT * FROM EmployeeInfo E1 WHERE 3>
(
	SELECT COUNT(*) FROM EmployeeInfo E2

WHERE E1.EmpID<E2.EmpID);

SELECT * FROM EmployeeInfo;


--> 25). Write a query to find the third-highest salary from the EmpPosition table.

SELECT TOP(3) Salary FROM EmployeePosition  
ORDER BY Salary DESC ;

SELECT TOP (1) * FROM
   (SELECT TOP (3) Salary FROM EmployeePosition ORDER BY salary DESC) 
ORDER BY salary ASC;

SELECT Salary
FROM EmployeePosition Emp1
WHERE 2 = (
                SELECT COUNT( DISTINCT ( Emp2.Salary ) )
                FROM EmployeePosition Emp2
                WHERE Emp2.Salary > Emp1.Salary
            );

--> 26). Write a query to display the first and the last record from the EmployeeInfo table.

SELECT * FROM EmployeeInfo WHERE EmpID=(SELECT MIN(EmpID) FROM EmployeeInfo);

SELECT * FROM EmployeeInfo WHERE EmpID=(SELECT MAX(EmpID) FROM EmployeeInfo);


--> 27). Write a query to add email validation to your database.

 
/* SELECT * FROM table_name WHERE Email NOT LIKE '%_@__%.__%' ; */.

Create FUNCTION udf_ValidateEmail (@email varChar(255))

RETURNS bit
AS
begin
return
(
select 
	Case 
		When 	@Email is null then 0	              
		When	charindex(' ', @email) 	<> 0 or
				charindex('/', @email) 	<> 0 or 
				charindex(':', @email) 	<> 0 or 
				charindex(';', @email) 	<> 0 then 0 
		When len(@Email)-1 <= charindex('.', @Email) then 0
		When 	@Email like '%@%@%'or 
				@Email Not Like '%@%.%'  then 0
		Else 1
	END
)
end


--> 28). Write a query to retrieve Departments who have less than 2 employees working in it.

SELECT Department, COUNT(EmpID) FROM EmployeeInfo GROUP BY Department HAVING COUNT(EmpID) <2;

SELECT * FROM EmployeeInfo;


--> 29). Write a query to retrieve EmpPostion along with total salaries paid for each of them.

SELECT * FROM EmployeePosition;

SELECT EmpPosition , SUM(Salary) AS Total_Salary FROM EmployeePosition GROUP BY EmpPosition;


--> 30). Write a query to fetch 50% records from the EmployeeInfo table.

SELECT * FROM EmployeeInfo 
WHERE	EmpID<= (SELECT COUNT(EmpID)/2 FROM EmployeeInfo); 

SELECT * FROM EmployeeInfo;