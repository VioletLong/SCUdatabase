select M.CompanyName, round(cast(M.num as float)/ N.num *100,2) as rate
from(select count(*) as num ,ShipVia, CompanyName from `Order`,Shipper where ShipVia=Shipper.Id and ShippedDate>RequiredDate group by ShipVia)M,
(select count(*) as num ,ShipVia, CompanyName from `Order`,Shipper where ShipVia=Shipper.Id group by ShipVia)N
where M.ShipVia=N.ShipVia
order by rate desc;
