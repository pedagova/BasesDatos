SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

SELECT *
FROM EMPLOYEES
WHERE commission_pct is not null;

SELECT first_name
FROM EMPLOYEES
WHERE manager_id is not null;


select E.first_name 
FROM employees E
WHERE department_id = (
  SELECT department_id
  FROM departments
  WHERE department_name = 'Sales');

create or replace view A1(ident) as 
select employee_id 
FROM job_history 
WHERE department_id = (
SELECT department_id
FROM departments
WHERE department_name = 'Sales');

SELECT distinct first_name, employees.employee_id
   FROM employees, A1
   WHERE employee_id  = A1.ident;
   
select distinct e2.first_name
from employees e1, employees e2
where (e1.employee_id is not null) and (e2.employee_id = e1.manager_id);


select distinct e2.first_name, e1.first_name, e2.salary, e1.salary
from employees e1, employees e2
where (e1.employee_id is not null) and (e2.employee_id = e1.manager_id) and e2.salary < e1.salary;
