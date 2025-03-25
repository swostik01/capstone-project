WITH a AS (
    SELECT 
        OrderDate,
        StockDate,
        OrderNumber,
        ProductKey,
        CustomerKey,
        TerritoryKey,
        OrderLineItem,
        OrderQuantity,
        FileLocation,
        LoadTime
    FROM {{ source('raw_adventure', 'sales_data') }}
)
SELECT * FROM a
