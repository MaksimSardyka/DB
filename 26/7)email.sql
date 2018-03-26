/*
- для каждого рабоника установить email = 5 первые буквы имени + 5 первые буквы фамилии
*/
UPDATE employees
SET 
    email = concat(left(first_name,5),left(last_name,5),left('@hosting.by',11)) ;
SELECT * FROM employees;