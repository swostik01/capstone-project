WITH sales AS (
    SELECT 
        s.OrderNumber,
        s.OrderDate,
        s.CustomerKey,
        c.FirstName || ' ' || c.LastName AS CustomerName,
        s.ProductKey,
        p.ProductName,
        p.ProductPrice,
        s.OrderQuantity,
        (s.OrderQuantity * p.ProductPrice) AS TotalRevenue
    FROM {{ ref('stg_sales') }} s
    LEFT JOIN {{ ref('stg_customer') }} c ON s.CustomerKey = c.CustomerKey
    LEFT JOIN {{ ref('stg_product') }} p ON s.ProductKey = p.ProductKey
)
SELECT * FROM sales
