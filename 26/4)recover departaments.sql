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