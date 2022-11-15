-- Deleting summary data for each of the continents--
delete from
project_fact_table
where country_id like 'OWID\_%'


-- Total Cases vs Total Deaths and the Death Percentage
SELECT country, actual_date, Month_Name, Day_Name, total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_Percentage
from project_fact_table p
join country c
on c.country_id = p.country_id
join datedimension d
on d.date_id = p.date_id
where country like '%Nigeria%'
order by country, actual_date

Select CONTINENT, sum(total_cases), sum(new_cases)
from project_fact_table p
join country c
on c.country_id = p.country_id
group by CONTINENT

select * from project_fact_table

-- inner join of country and fact table--
SELECT * FROM project_fact_table P
INNER JOIN country C
ON C.COUNTRY_ID = P.COUNTRY_ID

-- left and right join of the three tables--
SELECT * FROM project_fact_table P
LEFT JOIN country C
ON C.COUNTRY_ID = P.COUNTRY_ID
UNION
SELECT * FROM project_fact_table P
RIGHT JOIN country C
ON C.COUNTRY_ID = P.COUNTRY_ID

-- count of country and fact table--
Select count(*) from project_fact_table
select  count(*) from country


-- Analysing the sum of deaths and new cases per continent--
Select country, sum(new_deaths), sum(new_cases)
from project_fact_table p
join country c
group by country

SELECT *
FROM project2..project_fact_table
ORDER BY 3,4

-- Total Cases vs Population
-- Percentages of the population that got covid
SELECT c.country, d.actual_date, c.population, p.total_cases, (total_cases/population)*100 as Death_Percentage
from project_fact_table p
join country c
on c.country_id = p.country_id
join datedimension d
on d.date_id = p.date_id
order by 1,2 

Create view MaximumDeath as 
Select Country, Max(total_deaths) as MaxDeath, Min(total_cases) as MinCases
from project_fact_table p
join country c
on c.country_id = p.country_id
group by country
order by MaxDeath

select actual_date, SUM(new_cases), Sum(new_deaths), Sum(new_deaths)/SUM(new_cases)*100 as DeathPercentage
from project_fact_table p
join datedimension d
on d.date_id = p.date_id
group by actual_date
order by 1,2

