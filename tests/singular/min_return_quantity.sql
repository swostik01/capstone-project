with source as
(select * from {{ ref('stg_returns')}})

select *
from source
where returnquantity < 1
