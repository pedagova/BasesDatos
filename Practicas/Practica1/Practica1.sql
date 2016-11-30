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
