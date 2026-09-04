select
    customer_id,
    customer_name,
    country
from {{ ref('stg_customers') }}
where not is_test_account
