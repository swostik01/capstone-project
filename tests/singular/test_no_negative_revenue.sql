with p as
(select * from {{ ref('marts_revenue_by_category') }})

SELECT SalesYear, CategoryName, SubcategoryName, TotalRevenue, TotalCost
FROM p
WHERE TotalRevenue < 0 OR TotalCost < 0
