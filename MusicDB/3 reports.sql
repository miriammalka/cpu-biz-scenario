
--Reports:
--1) I need to know if I have any repeat customers and what they rented
select i.Instrument, i.CustomerLastName, CustomerCount = count(*)
from instrument i
group by i.CustomerLastName, i.Instrument
--2)I need to know the most popular category of instrument that has ever been rented
select PopularityAmount = count(*), i.category
from instrument i
group by i.Category
--3) I need to know which instrument (that is not being currently rented) made the most profit
select top (1) Profit = sum(i.profit), i.Instrument 
from instrument i 
where i.DateReturned < getdate()
group by i.Instrument
order by sum(profit) desc
--4) I need to know which instruments were rented for only one month (so I could know if I should just sell them off)
select * 
from instrument i 
where datediff(month,i.DateRented,i.DateReturned) = 1










