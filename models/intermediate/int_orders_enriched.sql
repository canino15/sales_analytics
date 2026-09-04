with orders as (
    select * from {{ ref('stg_orders') }}
),
products as (
    select * from {{ ref('stg_products') }}
),
customers as (
    select * from {{ ref('stg_customers') }}
)
select
    o.order_id,
    o.customer_id,
    c.country          as customer_country,
    c.is_test_account,
    o.order_date,
    o.order_status,
    o.product_id,
    o.quantity,
    p.unit_price,
    o.quantity * p.unit_price as order_amount
from orders o
join products p  on o.product_id = p.product_id
join customers c on o.customer_id = c.customer_id
