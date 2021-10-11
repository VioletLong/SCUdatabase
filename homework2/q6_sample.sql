select ProductName, CompanyName, ContactName 
from (select * from `Order` left outer join OrderDetail on `Order`.Id=OrderId left outer join Customer on CustomerId=Customer.Id left outer join Product on ProductId=Product.Id where Discontinued = 1 order by OrderDate) 
group by ProductId 
order by ProductName;
