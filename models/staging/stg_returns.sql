SELECT 
    ReturnDate,
    TerritoryKey,
    ProductKey,
    ReturnQuantity,
    FileLocation,
    LoadTime
FROM {{ source('raw_adventure', 'returns_data') }}  
WHERE ReturnQuantity > 0
