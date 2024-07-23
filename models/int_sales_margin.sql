SELECT
    *
    ,CAST(sales.revenue as float64) * CAST(product.purchase_price as float64) as margin
    ,CAST(sales.quantity as float64) * CAST(product.purchase_price as float64) as purchase_cost
FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }} AS sales
JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }} AS product
ON sales.products_id = product.products_id