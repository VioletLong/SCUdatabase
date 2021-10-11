select CompanyName, CustomerId, round(totalexp,2)
from(select IFNULL(CompanyName, "MISSING_NAME") as CompanyName, CustomerId, totalexp, NTILE(4) over(order by cast(totalexp as float)) as quartile 
from (select `Order`.CustomerId, sum(UnitPrice*Quantity) as totalexp from `Order` left outer join OrderDetail on `Order`.Id = OrderDetail.OrderId group by `Order`.CustomerId)
left outer join Customer on CustomerId = Customer.Id)
where quartile=1
order by cast(totalexp as float);
