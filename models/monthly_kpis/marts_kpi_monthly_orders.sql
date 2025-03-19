WITH monthly_orders AS (
    SELECT 
        DATE_TRUNC('MONTH', OrderDate) AS OrderMonth,
        COUNT(DISTINCT OrderNumber) AS MonthlyOrders
    FROM {{ ref('marts_sales') }}
    GROUP BY 1
)

SELECT 
    month(OrderMonth) as order_month,
    year(OrderMonth) as order_year,
    MonthlyOrders
FROM monthly_orders
ORDER BY OrderMonth DESC
