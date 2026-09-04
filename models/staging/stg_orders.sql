with source as (
    select * from {{ ref('raw_orders') }}
)
select
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    status as order_status
from source
