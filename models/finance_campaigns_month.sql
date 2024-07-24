SELECT
DATE_TRUNC(date_date, MONTH) AS month
,SUM(ads_margin) AS ads_margin
,ROUND(SUM(average_basket),2) AS average_basket
,ROUND(SUM(revenue),2) AS revenue
FROM {{ ref('finance_campaigns_day') }}
GROUP BY month
ORDER BY month DESC
