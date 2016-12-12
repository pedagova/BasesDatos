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


select empl.first_name, jefe.first_name, d1.department_name, d2.department_name
from employees empl, employees jefe, departments d1, departments d2
where jefe.employee_id = empl.manager_id and empl.department_id <> jefe.department_id and d1.department_id = empl.department_id and d2.department_id = jefe.department_id ;

select *
from employees
where salary > 10000;
