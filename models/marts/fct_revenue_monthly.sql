select
    date_trunc('month', order_date) as order_month,
    customer_country,
    count(distinct order_id)        as orders_count,
    sum(order_amount)               as revenue
from {{ ref('fct_orders') }}
where order_status = 'completed'
group by 1, 2
