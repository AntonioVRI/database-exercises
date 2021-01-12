use employees;

select first_name, last_name
from employees
where gender = 'M'
and (first_name in ('Irena', 'Vidya')
    or first_name = 'Maya');
