with source as (
    select * from {{ ref('raw_customers') }}
)
select
    customer_id,
    customer_name,
    country,
    is_test_account
from source
