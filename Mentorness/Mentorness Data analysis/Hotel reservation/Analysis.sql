use hotel;

select * from hotel_reservation;

CREATE TABLE new_data AS
	SELECT Booking_ID, no_of_adults, no_of_children, no_of_weekend_nights, no_of_week_nights, 
	type_of_meal_plan, room_type_reserved, lead_time, 
	STR_TO_DATE(arrival_date, "%d-%m-%Y") AS arrival_date, market_segment_type, 
	avg_price_per_room, booking_status
	FROM hotel_reservation;

-- 1. What is the total number of reservations is the dataset

select count(*) as 'Total Reservations' from new_data;

-- 2. Which meal plan is the most popular among guests? 

select type_of_meal_plan, count(type_of_meal_plan) from new_data group by type_of_meal_plan;


-- 3. What is the average price per room for reservations involving children?  

select avg(avg_price_per_room) from new_data where no_of_children > 0;

-- 4. How many reservations were made for the year 20XX (replace XX with the desired year)?  

select booking_status, count(booking_status) as 'Total reservations in 2017' from new_data 
where year(arrival_date) = 2017 group by booking_status;

select booking_status, count(booking_status) as 'Total reservations in 2018' from new_data 
where year(arrival_date) = 2018 group by booking_status;

select count(*) as 'Total reservations in 2017' from new_data 
where year(arrival_date) = 2017 and booking_status = 'Not_Canceled';

select count(*) as 'Total reservations in 2018' from new_data 
where year(arrival_date) = 2018 and booking_status = 'Not_Canceled';

-- 5. What is the most commonly booked room type?  

select room_type_reserved, count(room_type_reserved) from new_data group by room_type_reserved;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?  

select count(*) as 'Reservations fall on weekends' from new_data where no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations?

select max(lead_time) as 'Highest lead time for reservation' from new_data;
select min(lead_time) as 'Highest lead time for reservation' from new_data;
select avg(lead_time) as 'Average lead time for reservation' from new_data;

-- 8. What is the most common market segment type for reservations?  

select market_segment_type, count(market_segment_type) 
from new_data 
group by market_segment_type 
order by count(market_segment_type) desc;

-- 9. How many reservations have a booking status of "Confirmed"?  

select count(*) as 'Confirmed Reservations' from new_data where booking_status = 'Not_Canceled';

-- 10. What is the total number of adults and children across all reservations?  

select sum(no_of_adults) as 'Total number of adults', sum(no_of_children) as 'Total number of children'
from new_data;

-- 11. What is the average number of weekend nights for reservations involving children? 

select avg(no_of_weekend_nights) as 'Average number of weekend nights involving children' 
from new_data where no_of_children > 0;

-- 12. How many reservations were made in each month of the year? 

Alter table new_data 
Add month_name Text; 

update new_data 
set month_name = monthname(arrival_date); 

select * from new_data;

select month_name, count(month_name) as 'Total reservations in 2017' from new_data 
where year(arrival_date) = 2017 
group by month_name
order by count(month_name) desc;

select month_name, count(month_name) as 'Total reservations in 2018' from new_data 
where year(arrival_date) = 2018 
group by month_name
order by count(month_name) desc;

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?  

select room_type_reserved, avg(no_of_weekend_nights + no_of_week_nights) as 'Total number of nights'
from new_data 
group by room_type_reserved
order by avg(no_of_weekend_nights + no_of_week_nights) desc;

-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?

select room_type_reserved, count(*) as 'Total reservations', avg(avg_price_per_room) as 'Average price per room if children' 
from new_data 
where no_of_children > 0 
group by room_type_reserved
order by count(*) desc;

-- 15. Find the market segment type that generates the highest average price per room.  

select market_segment_type, count(*), avg(avg_price_per_room) as 'Average price per room'
from new_data
group by market_segment_type
order by avg(avg_price_per_room) desc;

