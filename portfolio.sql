select * from fame.`covid-deaths`
order by 3,4;

select * from fame.`covid-vaccinations`
order by 3,4;

select location, date, total_cases, new_cases, total_deaths, population
from fame.`covid-deaths`
order by 1,2;

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
from fame.`covid-deaths`
where location like '%states%'
order by 1,2;

select location, date, total_cases, population, (total_cases/population)*100 as case_percentage
from fame.`covid-deaths`
-- where location like '%states%'
order by 1,2;

select location, date, max(total_cases) as highest_count, population, max((total_cases/population))*100 as case_percentage
from fame.`covid-deaths`
-- where location like '%states%'
group by location, population
order by 1,2;

select location, date, max(total_cases) as highest_count, population, max((total_cases/population))*100 as case_percentage
from fame.`covid-deaths`
-- where location like '%states%'
group by location, population
order by case_percentage desc;

select location, max(cast(total_deaths as signed)) as Totaldeathcount
from fame.`covid-deaths`
-- where location like '%states%'
where continent is not null
group by location
order by Totaldeathcount desc;

select continent, max(cast(total_deaths as signed)) as Totaldeathcount
from fame.`covid-deaths`
-- where location like '%states%'
where continent is not null
group by continent
order by Totaldeathcount desc;

select date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
from fame.`covid-deaths`
-- where location like '%states%'
where continent is not null
group by date
order by 1,2;


select date, sum(total_cases), sum(cast(total_deaths as signed)), (sum(cast(total_deaths as signed))/sum(total_cases))*100 as death_percentage
from fame.`covid-deaths`
-- where location like '%states%'
where continent is not null
group by date
order by 1,2;

select kin.continent, kin.location, kin.date, kin.population, min.new_vaccinations
from fame.`covid-deaths` kin
join fame.`covid-vaccinations` min
	on kin.location = min.location
    and kin.date =min.date
where kin.continent is not null
order by 1,2,3

    







