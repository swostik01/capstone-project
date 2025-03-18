WITH customer_orders AS (
    SELECT 
        CustomerKey,
        ProductKey,
        COUNT(DISTINCT OrderDate) AS OrderCount
    FROM {{ ref('stg_sales') }}
    GROUP BY CustomerKey, ProductKey
)

SELECT 
    c.CustomerKey,
    c.FirstName,
    c.LastName,
    c.EmailAddress,
    c.AnnualIncome,
    ps.SUBCATEGORYNAME,
    co.ProductKey,
    p.ProductName,
    co.OrderCount
FROM customer_orders co
JOIN {{ ref('stg_customer') }} c ON co.CustomerKey = c.CustomerKey
JOIN {{ ref('stg_product') }} p ON co.ProductKey = p.ProductKey
JOIN {{ ref('product_subcategories')}} ps ON p.PRODUCTSUBCATEGORYKEY = ps.PRODUCTSUBCATEGORYKEY
where co.OrderCount > 1  
ORDER BY co.OrderCount DESC
