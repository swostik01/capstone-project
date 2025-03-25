WITH monthly_sales AS (
    SELECT 
        DATE_TRUNC('MONTH', OrderDate) AS SalesMonth,
        SUM(TotalRevenue) AS MonthlySalesRevenue
    FROM {{ ref('marts_sales') }}
    GROUP BY 1
)

SELECT 
    month(salesmonth) as sales_month,
    year(salesmonth) as sales_year,
    MonthlySalesRevenue
FROM monthly_sales
ORDER BY SalesMonth desc
