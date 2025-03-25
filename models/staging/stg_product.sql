WITH a AS (
    SELECT 
        ProductKey, 
        ProductSubcategoryKey, 
        ProductSKU, 
        INITCAP(ProductName) AS ProductName,
        ModelName,
        ProductDescription,
        ProductColor,
        ProductSize,
        ProductStyle,
        ProductCost,
        ProductPrice,
        FileLocation,
        LoadTime
    FROM {{ source("raw_adventure","product_lookup")}}
)
SELECT * FROM a
