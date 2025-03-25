SELECT 
    SalesTerritoryKey, 
    INITCAP(Region) AS Region,
    INITCAP(Country) AS Country,
    INITCAP(Continent) AS Continent,
    FileLocation,
    LoadTime
FROM {{ source('raw_adventure', 'territory_lookup') }}
