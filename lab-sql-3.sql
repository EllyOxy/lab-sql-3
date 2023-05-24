use sakila;

-- How many distinct (different) actors' last names are there?
select distinct last_name as "distinct"
from sakila.actor;

select distinct (count(last_name)) as "distinct"
from sakila.actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(language_id)
from language;

-- How many movies were released with "PG-13" rating?
select count(rating) as "PG-13" from film
where rating="PG-13";

-- Get 10 the longest movies from 2006
select title, release_year, length
from film
where release_year="2006"
order by length desc
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?
-- >>> DATEDIFF 1st rental date - last update ---syn DATEDIFF(interval, date1, date2)
select * from rental;

select datediff(days, (min(rental_date), (max(last_update)) 
from rental;

-- Show rental info with additional columns month and weekday. Get 20.
SELECT EXTRACT(month FROM rental_date) as month 
from rental
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select  weekday(rental_date) as 'weekend', rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
FROM rental
where weekday(rental_date)>4;

select  weekday(rental_date), rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
case
when rental_date = '6' then 'weekend'
when rental_date = '5' then 'weekend'
else 'workdays'
end as 'workday/weekend'
FROM rental;

-- How many rentals were in the last month of activity?
select rental_date,rental_id,return_date,last_update from rental
order by rental_date desc;

select count(rental_id) 
where rental_date > '2005-07-31'
from rental;

