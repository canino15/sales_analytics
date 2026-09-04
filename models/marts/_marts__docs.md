{% docs revenue_definition %}
**Revenue** is the sum of `order_amount` for orders whose status is `completed`, excluding
any orders placed by internal test accounts. Cancelled, pending, and refunded orders do not
contribute to revenue. This is the agreed, single definition used across all reporting; do
not recompute revenue anywhere else.
{% enddocs %}
