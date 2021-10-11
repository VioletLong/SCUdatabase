select Id, ShipCountry,'NorthAmerica'
from(select Id,ShipCountry from `Order` where (ShipCountry='USA' or ShipCountry='Mexico' or ShipCountry='Canada'))
where Id>15444 and Id<15466
UNION
select Id ,ShipCountry,'OtherPlace'
from(select Id,ShipCountry from `Order` where Id not in (select Id from `Order` where (ShipCountry='USA' or ShipCountry='Mexico' or ShipCountry='Canada')))
where Id>15444 and Id<15466
order by Id;
