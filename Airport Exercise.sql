/*
Airports Exercise 

Data source: https://ourairports.com/data/
Data dictionary: https://ourairports.com/help/data-dictionary.html

In this exercise we analyse the countries, airports and airports_frequencies table
These have  matching columns: 
* airports.ident matches airport_frequencies.airport_ident
* countries.code matches airports.iso_country
*/

-- Show 10 sample rows of the airports table
SELECT 	TOP 10 * FROM 	countries c;

-- Show 10 sample rows of the airports table
SELECT 	TOP 10 * FROM 	airports a;

-- Show 10 sample rows of the airports_frequencies table
SELECT 	TOP 10 * FROM airport_frequencies af;

-- These are the more interesting columns of the airports table  that we use in this exercise
SELECT TOP 10
	a.ident
	, a.iata_code
	, a.name
	, a.[type]
	, a.latitude_deg
	, a.longitude_deg
	, a.elevation_ft
	, a.iso_country
FROM airports a;

-- How many airports are in the airports table?
select count(*) from airports

-- How many frequencies are in the airport_frequencies table?
select count(distinct fequency_mhz) from airport_frequencies

-- How many airports of each type?
select type, count(type) AS NumberOfAirports 
from airports
group by type
order by NumberOfAirports DESC;

-- Is the airport.ident column unique? i.e. there are no duplicate values
select ident, count(*) AS NumberOfAirports
From airports
group by ident
having count(ident) > 1

SELECT a.ident, COUNT(*) NumberOfAirports
FROM airports as a
GROUP BY a.ident
HAVING COUNT(*) > 1
ORDER BY NumberOfAirports DESC

/*
Do a data quality check on the airports_frequencies table
Are there any orphan rows (frequencies without a matching airports)?
You can do this is several ways: LEFT JOIN, NOT IN, NOT EXISTS,...
*/

-- left join approach
select af.* 
from airport_frequencies af
left join airports a on af.airport_ident=a.ident
where a.ident is NULL

-- NOT EXISTS approach	
select af.* 
from airport_frequencies af
where not exists (select af.airport_ident from airports a where af.airport_ident = a.ident)

-- NOT IN approach	
select af.* 
from airport_frequencies af
where af.airport_ident not in (select a.ident from airports a)




/*
1. List airports.  Show the following columns: ident, iata_code, name, latitude_deg, longitude_deg 
2. Filter to those airports
  (a) of large_airports type 
  (b) in the United Kingdom or France (iso_country  GB, FR) 
  [advanced - in Europe i.e., country.continent = 'EU']
  (c) that have a latitude between 49 and 54 degrees
3. Order from the most northern airports to most southern airports
*/


/*
List the iso_country of the 5 countries with the most airports 
List in order of number of airports (highest first)
*/


/*
How many airports are in those 5 countries (with the most airports)?
Use three different approaches: temp table, CTE, subquery
*/

-- Write the temp table approach below here


-- Write the CTE approach below here

-- Write the subquery approach below here

/*
List those large airports (if any) without a frequency 
*/


/*
List airports (if any) that have missing (NULL) values for *both* latitude or longitude.
*/

/*
List airports (if any) that have missing (NULL) values for *either* latitude or longitude  but not both.
This may indicate some sort of data quality issue.
*/
