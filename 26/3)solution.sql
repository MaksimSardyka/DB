/*
5. Восстановить всю возможную информацию в таблицу locations, departments и employees.countries
- вставка в таблицу locations
*/
set @id = 0;
INSERT INTO locations 
	(street_address, 
	postal_code, 
	city, 
	state_province,
	country_id)
		SELECT DISTINCT
		lc.street_address,
		lc.postal_code,
		lc.city,
		lc.state_province,
		lc.country_id
		FROM report lc
		where lc.street_address is not null
		AND lc.postal_code is not null
		AND lc.city is not null 
		AND lc.state_province is not null
		AND lc.country_id is not null;
select * from `locations`;

/*
- вставка в таблицу departments
*/
set @id=0;
insert into departments(department_name, location_id)
select distinct department_name, l.location_id
from report r
left join locations l on
r.country_id = l.country_id
where (department_name is not null);

/*
- вставка в таблицу employees
*/
INSERT INTO employees(
	first_name,
	last_name,
	email,
	phone_number,
	hire_date,
	job_id,
	salary,
	commission_pct)
select distinct 
	FIRST_NAME,
	LAST_NAME,
	EMAIL is null,
	PHONE_NUMBER,
	HIRE_DATE,
	JOB_ID,
	SALARY,
	COMMISSION_PCT
	from report;
	
/*
 - для каждого работнака исключая менеджеров увеличить зарплату на 100$
*/
UPDATE `employees`
SET `salary` = `salary` + 100
WHERE `job_id` NOT LIKE '%MGR' AND `job_id` NOT LIKE '%MAN';

/*
- для каждого рабоника установить email = 5 первые буквы имени + 5 первые буквы фамилии
*/
UPDATE employees
SET 
    email = concat(left(first_name,5),left(last_name,5),left('@hosting.by',11)) ;
SELECT * FROM employees;
