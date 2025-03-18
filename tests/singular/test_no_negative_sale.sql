with a as 
(select * from {{ref('marts_sales_region')}})

select * 
from a
where totalsales < 0 or previousyearsales < 0
