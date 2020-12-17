DROP DATABASE IF EXISTS lab2;
create database lab2;
use lab2;
drop table if exists mobNum;
drop table  if exists Employees;
create table Employees (
emp_id varchar(20),
first_name  varchar(20) not null,
middle_name  varchar(20),
last_name  varchar(20) not null,
gender ENUM('M', 'F') not null,
apartment_number varchar(20) not null,
street_no int,
street_name  varchar(20) not null,
city  varchar(20) not null,
state  varchar(20) not null,
zip_code varchar(20) not null,
designation  varchar(20) not null,
date_of_birth date not null,
salary int not null,
joining_date date not null,
email_ID  varchar(30) not null,
constraint 
primary key(emp_id));

create table mobNum(
emp_id varchar(20),
mobile_number varchar(15),
foreign key(emp_id)references Employees(emp_id));

insert into Employees values ('2019XYZ0030', 'Adarsh',NULL,'Sharma', 'M', 'A/380', NULL, 'M.G. road','Indore','M.P.','452018', 'Team Lead', '1990-12-19', 80000, '2005-07-01', 'sharma.adarsh90@yymail.com'), ('2019XYZ0031', 'Mohit', NULL,   'Malviya'   , 'M'   , 'C/290' ,54,   'Vijaynagar'  , 'Indore' , 'M.P.','452011', 'Developer', '1983-03-12', 50000, '2005-08-10', 'mohit_malviya1203@yymail.com'), ('2019XYZ0032', 'Amit','Kumar',   'Rai'   , 'M', 'A/181',NULL, 'abhinandan nagar'   ,'Indore'   , 'M.P','452010', 'HR', '1990-12-15', 90000, '2005-09-19', 'amit_rai1990@coolmail.com'), ('2019XYZ0033', 'Ayushi',NULL, 'Jain', 'F', 'E-320', NULL, 'Friganj', 'Ujjain', 'M.P.','452016', 'Developer', '1992-07-01', 30000, '2007-02-05', 'jain_aysuhi1992@coolmail.com'), ('2019XYZ0034','Anand',NULL,'Diwedi', 'M', 'A/661',58,'Bhavarkuwa', 'Indore', 'M.P.', '452020', 'Tester' , '1994-10-02', 30000, '2006-04-15', 'anand007@coolmail.com'), ('2019XYZ0035', 'Khushboo', NULL, 'Rathi', 'F', 'C/230', 280 ,'Shastri nagar', 'Ujjain',' M.P.', '452023', 'Tester' , '1992-01-05', 30000, '2008-06-20', 'k_rathi12@coolmail.com'); insert into mobNum values ('2019XYZ0030' , '7012500001'), ('2019XYZ0030' , '7710000030'), ('2019XYZ0030', '8985232632'), ('2019XYZ0031', '8982646300'), ('2019XYZ0032', '7012245201'), ('2019XYZ0032', '9424075236'), ('2019XYZ0033', '7012015121'), ('2019XYZ0033', '8985632520'), ('2019XYZ0034', '8865263452'), ('2019XYZ0035', '8458512332');


SELECT emp_id, CONCAT(first_name,' ',
 IF(isnull(middle_name), '',CONCAT(middle_name,' '))  , last_name) as emp_name from Employees;

SELECT first_name, last_name from Employees 
WHERE gender='F';

SELECT DISTINCT salary from Employees;

SELECT first_name, last_name from Employees 
WHERE designation="HR";

SELECT CONCAT(first_name,' ',
 IFNULL(middle_name, ''),' ',last_name) as emp_name from Employees
where year(joining_date) > 2006;

SELECT min(timestampdiff(year, date_of_birth,'2020-02-19'))
as age_of_youngest
from Employees ;

SELECT emp_id, CONCAT(first_name,' ',
 IFNULL(middle_name, ''),' ',last_name) as emp_name,
salary from Employees ORDER BY salary desc;

SELECT first_name, last_name from Employees
where year(date_of_birth) between 1992 and 1995;

SELECT sum(salary) as sal_sum from Employees;

SELECT count(emp_id) as tot_male from Employees 
where gender='M';

SELECT max(salary) as max_sal from Employees;

SELECT count(emp_id) as dev_or_tester from Employees
where designation="Developer" or designation="Tester";

select emp_id, CONCAT(first_name, ' ', IFNULL(middle_name, ''), ' ', last_name) as emp_name from Employees where (first_name LIKE "A%") and (middle_name is null); 			 
 
SELECT mobNum.emp_id, Employees.first_name, Employees.last_name from mobNum 
inner join Employees on Employees.emp_id = mobNum.emp_id
GROUP BY emp_id having count(mobile_number)>2;


SELECT emp_id, first_name, last_name from Employees
	where emp_id in 
(
	SELECT emp_id from mobNum
	GROUP BY emp_id having count(*)>2
);

select sum(0.01*salary*timestampdiff(year, joining_date, '2020-02-19')) as lol from Employees
where timestampdiff(year, joining_date, '2020-02-19')>12;

select first_name, last_name , salary from Employees
ORDER BY salary desc limit 3;
