select
    date_date,
    orders_id,
    sales.products_id,
    revenue,
    quantity,
    purchase_price,
    cast(sales.revenue as float64) * cast(product.purchase_price as float64) as margin,
    cast(sales.quantity as float64)
    * cast(product.purchase_price as float64) as purchase_cost,
    {{margin_percent('revenue','cast(product.purchase_price as float64)')}} AS margin_percent
from {{ ref("stg_gz_raw_data__raw_gz_sales") }} as sales
join
    {{ ref("stg_gz_raw_data__raw_gz_product") }} as product
    on sales.products_id = product.products_id
