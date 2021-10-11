select RegionDescription, FirstName, LastName, BirthDate
from (select * from Employee left outer join EmployeeTerritory on Employee.Id=EmployeeTerritory.employeeId left outer join Territory on EmployeeTerritory.TerritoryId=Territory.Id left outer join Region on Territory.RegionId=Region.Id
    order by Employee.BirthDate desc)
group by RegionId
order by RegionId;
