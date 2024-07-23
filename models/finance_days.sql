SELECT
date_date,
SUM(orders_id) AS nb_transactions,
ROUND(AVG(total_revenue),2) AS average_basket,
ROUND(SUM(total_revenue),2) AS revenue,
ROUND(SUM(operational_margin),2) AS total_operational_margin
FROM {{ ref("int_orders_operational") }}
GROUP BY date_date
    