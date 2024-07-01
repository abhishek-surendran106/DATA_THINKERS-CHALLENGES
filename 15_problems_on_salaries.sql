-- 1. show all columns and rows in the table
select * from salaries;

-- 2. show only employeename and jobtitle columns
select employeename, jobtitle from salaries;

-- 3. show the number of employees in the table
select count(*) as number_of_employees from salaries;
select count(employeename) as  number_of_employees from salaries;

-- 4. show the unique job titles in the table
select distinct jobtitle from salaries;
select count(distinct jobtitle) as number_of_job_titles from salaries;

-- 5. show the job title and overtime pay for all employees with overtime pay greater than 50000
select employeename, jobtitle, overtimepay from salaries where OvertimePay > 50000 order by OvertimePay desc;

-- 6. show the average base pay for all employees
select round(avg(basepay),2) as average_salary from salaries;

-- 7. show the top 10 highest paid employees
select employeename, totalpay from salaries order by TotalPay desc limit 10;

with t1 as
(select employeename, totalpay from salaries),
t2 as
(select *, rank() over(order by totalpay desc) as rnk from t1)
select employeename, totalpay from t2 where rnk <=10;


-- 8. show average of basepay, overtimepay, and otherpay for each employee
select 
employeename, round((BasePay+overtimepay+otherpay)/3, 2) as average_pay
from salaries;

-- 9. show all the employees who have the word "manager" in the job title
select employeename, jobtitle from salaries where jobtitle like "%manager%";

-- 10. show all employee with a job title not equal to "manager"
select employeename, jobtitle from salaries where jobtitle not like "%manager%";

-- 11. show all employees with a total pay between 50000 and 75000
select * from salaries where TotalPay between 50000 and 75000;
select * from salaries where TotalPay >= 50000 and TotalPay <= 75000;

-- 12. show all employees with a base  pay less than 50000 or a totalpay greater than 100000
select * from salaries where BasePay < 50000 or TotalPay > 100000;

-- 13. show all employees with a total  pay benefits value between 125000 and 150000 and a job title containing the word "director"
select * from salaries where totalpaybenefits between 125000 and 150000 and jobtitle like "%director";

-- 14. show all employees ordered by their total pay benefits in decending order
select * from salaries order by TotalPayBenefits desc;

-- 15. show all job titles with an average base pay of at least 100000 and order them by the average base pay in decending order
select jobtitle, round(avg(basepay),2) as average_basepay from salaries group by jobtitle having average_basepay >=100000 order by average_basepay desc;
