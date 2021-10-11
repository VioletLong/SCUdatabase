select CategoryName ,num, round(averageprice,2), minimumprice, maximumprice, onorder
from(select CategoryName,count(*) as num, avg(UnitPrice) as averageprice, min(UnitPrice) as minimumprice, max(UnitPrice) as maximumprice, sum(UnitsOnOrder) as onorder
from Product, Category	
where CategoryId=Category.Id 
group by CategoryId) natural join Category
where num>10
order by Category.Id
