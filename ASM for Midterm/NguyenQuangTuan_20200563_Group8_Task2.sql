SELECT  YEAR(OrderDate) AS OrderYear,
        MONTH(OrderDate) AS OrderMonth,
        SUM(SalesAmount) AS InternetSalesAmount,
        LAG(SUM(SalesAmount), 12)   OVER(ORDER BY YEAR(OrderDate), MONTH(OrderDate)) AS InternetMonthAmount_LastYear,
        (SUM(SalesAmount) -  LAG(SUM(SalesAmount), 12)   OVER(ORDER BY YEAR(OrderDate), MONTH(OrderDate)))
            /  LAG(SUM(SalesAmount), 12)   OVER(ORDER BY YEAR(OrderDate), MONTH(OrderDate)) * 100 AS PercentSalesGrowth
FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY YEAR(OrderDate), MONTH(OrderDate)