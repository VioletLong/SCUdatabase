select group_concat(ProductName,", ") 
from `Order` left outer join OrderDetail on "Order".Id = OrderDetail.OrderId left outer join Product on OrderDetail.ProductId = Product.Id left outer join Customer on "Order".CustomerId = Customer.Id 
where Customer.CompanyName = 'Queen Cozinha' and `Order`.OrderDate between datetime('2014-12-25 00:00:00') and datetime('2014-12-25 23:59:59');
