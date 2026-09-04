select
    order_id,
    customer_id,
    customer_country,
    order_date,
    order_status,
    order_amount
from {{ ref('int_orders_enriched') }}
where not is_test_account
