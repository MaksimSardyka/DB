/*
5. Восстановить всю возможную информацию в таблица locations, departments и employees.countries
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