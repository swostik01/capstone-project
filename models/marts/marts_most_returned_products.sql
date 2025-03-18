WITH returns_summary AS (
    SELECT 
        pc.categoryname,
        r.ProductKey,
        p.ProductName,
        SUM(r.ReturnQuantity) AS TotalReturns
    FROM {{ ref('stg_returns') }} r
    JOIN {{ ref('stg_product') }} p ON r.ProductKey = p.ProductKey
    JOIN {{ ref('product_subcategories') }} ps ON p.ProductSubCategoryKey = ps.ProductSubCategoryKey
    JOIN {{ ref('product_categories') }} pc ON ps.productcategorykey = pc.productcategorykey
    GROUP BY 1,2,3
)

SELECT 
    rs.CategoryName,
    rs.ProductKey,
    rs.ProductName,
    rs.TotalReturns,
    RANK() OVER (PARTITION BY rs.CategoryName ORDER BY rs.TotalReturns DESC) AS ReturnRank
FROM returns_summary rs
ORDER BY rs.CategoryName, ReturnRank
