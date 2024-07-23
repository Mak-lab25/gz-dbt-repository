SELECT
        m.orders_id,
        m.date_date,
        s.shipping_fee,
        s.ship_cost,
        s.logcost,
        total_margin + shipping_fee-logcost-cast(ship_cost AS float64) AS operational_margin
    FROM {{ ref("int_orders_margin") }} as m
    JOIN {{ ref("stg_gz_raw_data__raw_gz_ship") }} as s
    USING(orders_id)