select CustomerFullName, CustomerKey, SalesAmount, OrderMonth = month.m, OrderYear
from (values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12)) month(m)
cross apply(
	select top 5 rtrim(concat(FirstName +' ', MiddleName + ' ', LastName +' ')) as CustomerFullName, 
				d.CustomerKey, sum(f.SalesAmount) as SalesAmount,
				month(f.OrderDate) as OrderMonth, year(f.OrderDate) as OrderYear from DimCustomer as d
	inner join FactInternetSales f on f.CustomerKey = d.CustomerKey
	where month(f.OrderDate) = month.m
	group by d.CustomerKey, rtrim(concat(FirstName +' ', MiddleName + ' ', LastName +' ')), 
				month(f.OrderDate), year(f.OrderDate)
	order by SalesAmount desc 
) as t