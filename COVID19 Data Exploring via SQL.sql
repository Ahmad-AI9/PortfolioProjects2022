
----Exploring Data of COVID-19---- 

----Skills: Joins, Aggregate Functions, window Functions and more to be updated----

select * 
from portfolioProject.dbo.CovidDeaths
where continent is not null
order by 3,4;


select * 
from portfolioProject..Covidvaccinations
order by 3,4;

select Location,date,total_cases,new_cases,total_deaths,population
from portfolioProject..coviddeaths
where continent is not null
order by 1,2



-- Total Cases vs total deaths  in saudi:

select Location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as Death_Percentage
from portfolioProject..coviddeaths
where location like 'saudi%'
order by 1,2

-- Total Cases vs population in saudi:

select Location,date,total_cases, population , (total_cases/population)*100 as Cases_Percentage
from portfolioProject..coviddeaths
where location = 'saudi arabia'
order by 1,2

-- Measuring the Max total cases in saudi:

select Location, MAX(cast(total_cases as int)) as max_number_infected, population , max((total_cases/population))*100 as Percentage_population_infected 
from portfolioProject..coviddeaths
where location like 'saudi%'
group by location,population

-- Showing Countries with Highest Death Count Per Population:

select Location, MAX(cast(Total_deaths as int)) as Total_Death_Count
from portfolioProject..coviddeaths
--where location like 'saudi%'
where continent is not null
group by Location
order by Total_Death_Count desc

-- By Continent:

select continent, MAX(cast(Total_deaths as int)) as Total_Death_Count
from portfolioProject..coviddeaths
--where location like 'saudi%'
where continent is not null
group by continent
order by Total_Death_Count desc
--


--total population vs Vaccinations:

select death.continent, death.location, death.location, death.date, death.population, vacc.new_vaccinations
from portfolioProject..CovidDeaths death
join portfolioProject..CovidVAccinations vacc
	on death.location = vacc.location
	and death.date = vacc.date
	where death.continent is not null
	and  vacc.new_vaccinations is not null
	order by 1,2,3

--
