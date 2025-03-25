WITH sales_by_region AS (
    SELECT 
        YEAR(OrderDate) AS SalesYear,
        t.continent, t.country, t.Region, 
        SUM(s.OrderQuantity * p.ProductPrice) AS TotalSales
    FROM {{ ref('stg_sales') }} s
    JOIN {{ ref('stg_product') }} p ON s.ProductKey = p.ProductKey
    JOIN {{ ref('stg_territory') }} t ON s.TerritoryKey = t.SalesTerritoryKey
    GROUP BY 1, 2, 3, 4
)
SELECT s1.SalesYear, s1.continent, s1.country, s1.Region, s1.TotalSales,
    ifnull(s2.TotalSales,0) AS PreviousYearSales,
    ifnull({{ y_o_y_comparison('s1.TotalSales', 'PreviousYearSales') }},0)AS Y_O_Y_Growth
FROM sales_by_region s1
left join sales_by_region s2
on s1.SalesYear = s2.SalesYear + 1 and s1.Region = s2.Region
