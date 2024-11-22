use medical;
select * from medical_data;
select Typeofsales from medical_data;
alter table medical_data rename column ï»¿Typeofsales to Typeofsales;

select * from medical_data where Typeofsales = 'Return';
select * from medical_data where Typeofsales = 'Sale';

-- Specialisation count

select specialisation, 
sum(case when Typeofsales = 'sale' then 1 else 0 end) as 'sale_count',
sum(case when Typeofsales = 'Return' then 1 else 0 end) as 'Return_count'
from medical_data
group by specialisation;

select specialisation, 
sum(case when Typeofsales = 'sale' then Quantity end) as 'sale_quantity',
sum(case when Typeofsales = 'Return' then ReturnQuantity end) as 'Return_quantity'
from medical_data
group by specialisation;

-- Department count

select Dept, 
sum(case when Typeofsales = 'sale' then 1 else 0 end) as 'sale_count',
sum(case when Typeofsales = 'Return' then 1 else 0 end) as 'Return_count'
from medical_data
group by Dept;

select Dept, 
sum(case when Typeofsales = 'sale' then Quantity end) as 'sale_quantity',
sum(case when Typeofsales = 'Return' then ReturnQuantity end) as 'Return_quantity'
from medical_data
group by Dept;

-- Date of bill count

select date_of_bill, 
sum(case when Typeofsales = 'sale' then 1 else 0 end) as 'sale_count',
sum(case when Typeofsales = 'Return' then 1 else 0 end) as 'Return_count'
from medical_data
group by date_of_bill;

select date_of_bill, 
sum(case when Typeofsales = 'sale' then Quantity end) as 'sale_quantity',
sum(case when Typeofsales = 'Return' then ReturnQuantity end) as 'Return_quantity'
from medical_data
group by date_of_bill;


select sum(Final_Cost) from medical_data where Typeofsales = 'sale';
select sum(Final_Cost) from medical_data where Typeofsales = 'Return';

select sum(RtnMRP) from medical_data;
select * from medical_data;

select DrugName, sum(RtnMRP) from medical_data
group by DrugName;

select SubCat, sum(RtnMRP) from medical_data group by SubCat;
select SubCat1, sum(RtnMRP) from medical_data group by SubCat1;