use da_project;

## kpi 1)
select FUEL_TYPE, sum(MMBtu_TOTAL) as MMBtu_TOTAL
from energy
where FUEL_TYPE in ('Ethane', 'Ethanol (100%)')
group by FUEL_TYPE;

## kpi 2)
select avg(GWht_TOTAL) as avg_GWht_TOTAL
from energy
where FACILITY_NAME = '3M Company' ;


## kpi 3)
select UNIT_NAME, avg (GWht_TOTAL) as avg_GWht_TOTAL
from energy 
where UNIT_NAME between 1950 and 2020
group by UNIT_NAME
order  by UNIT_NAME;

## kpi 4)
select MECS_Region,
       concat(round(((sum(MMBtu_TOTAL)/ (select sum(MMBtu_TOTAL) from energy))*100),2),"%") as MMBtu_Percentage,
		concat(round(((sum(GWht_TOTAL)/ (select sum(GWht_TOTAL) from energy))* 100),2),"%") as  GWht_Percentage
from energy

group by MECS_Region;


## kpi 5)
select PRIMARY_NAICS_TITLE, count(*) as TotalFacilities, 
             count(distinct FACILITY_NAME) as UniqueFacilities,
             count( distinct FUEL_TYPE) as UniqueFuelTypes 
from energy 
group by  PRIMARY_NAICS_TITLE;



