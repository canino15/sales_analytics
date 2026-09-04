with source as (
    select * from {{ ref('raw_products') }}
)
select
    product_id,
    product_name,
    category,
    unit_price
from source
