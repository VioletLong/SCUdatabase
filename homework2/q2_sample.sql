select distinct ShipName,substr(ShipName,1,instr(ShipName,'-')-1)
from `Order`
where instr(ShipName,'-')>0
order by ShipName;