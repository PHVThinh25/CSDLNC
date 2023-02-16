CREATE EVENT btvn2.employess
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 day
ON COMPLETION PRESERVE
DO
insert into btvn2.employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id)
values ('207', 'Phan','Thinh','jiken2505@gmail.com','577725','25/05/2002','30','40000','101','11',NOW());

-- - viet 2 event
CREATE EVENT btvn2.event_countries
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 5 minute
ON COMPLETION PRESERVE
DO
insert into btvn2.countries(country_id, country_name, region_id)
values ('100', 'Thinh','111',NOW());

CREATE EVENT btvn2.event_jobs
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 week
ON COMPLETION PRESERVE
DO
insert into btvn2.jobs(job_id, job_title, min_salary, max_salary)
values ('19','stren','5400.00','8400.00',NOW());

-- - viet 2triegger

DELIMITER $$
create trigger btvn2.employess_03
before insert on btvn2.employees
for each row
begin
	if (not exists( select* from employees where email like '%.org'))
    then signal sqlstate '45000'
     set MESSAGE_TEXT = 'them thanh cong';
	end if;
end;$$
drop trigger btvn2.employess_02;
insert into btvn2.employees(email) values('luis.popp@sqltutorial.org')