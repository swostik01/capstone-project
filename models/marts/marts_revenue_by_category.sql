WITH revenue_by_category AS (
    SELECT 
        YEAR(s.OrderDate) AS SalesYear,
        pc.CategoryName, c.SUBCATEGORYNAME,
        SUM(s.OrderQuantity * p.ProductPrice) AS TotalRevenue,
        SUM(s.OrderQuantity * p.ProductCost) AS TotalCost
    FROM {{ ref('stg_sales') }} s
    JOIN {{ ref('stg_product') }} p ON s.ProductKey = p.ProductKey
    JOIN {{ ref('product_subcategories') }} c ON p.ProductSubcategoryKey = c.ProductSubcategoryKey  
    JOIN {{ ref('product_categories') }} pc ON c.ProductCategoryKey = pc.ProductCategoryKey 
    GROUP BY 1, 2, 3
)

SELECT 
    r1.SalesYear, 
    r1.CategoryName, 
    r1.SUBCATEGORYNAME,
    r1.TotalRevenue,
    r1.TotalCost,
    r1.TotalRevenue - r1.TotalCost as Profit,
    IFNULL(r2.TotalRevenue, 0) AS PreviousYearSales,
    IFNULL({{ y_o_y_comparison('r1.TotalRevenue', 'r2.TotalRevenue') }}, 0) AS Y_O_Y_Growth 
FROM revenue_by_category r1 
LEFT JOIN revenue_by_category r2
ON r1.SalesYear = r2.SalesYear + 1 
AND r1.CategoryName = r2.CategoryName
