with source as 
(select * from {{ref('stg_sales')}})

select OrderNumber,productkey, COUNT(*) AS duplicate_count
from source
GROUP BY 1,2
having duplicate_count > 1
ORDER BY duplicate_count DESC
