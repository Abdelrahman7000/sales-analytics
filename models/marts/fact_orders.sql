WITH cte AS(
    SELECT 
        o.shipping_id,
        o.ship_date,
        o.order_id,
        o.order_priority,
        o.order_date,
        o.market,
        o.customer_id,
        od.product_id,
        od.sales,
        od.quantity,
        od.discount,
        od.profit,
        od.shipping_cost

    from {{ref("order_shipping_det")}} o
    Join {{ref("stg_order_detail")}} od 
    on o.order_id=od.order_id  
)

SELECT 
    cte.customer_id,
    cte.order_id,
    cte.shipping_id,
    cte.product_id,
    cte.order_priority,
    c.has_returned is_returned,
    cte.order_date,
    cte.ship_date,
    cte.market,
    cte.discount,
    cte.profit,
    cte.sales,
    cte.quantity,
    cte.shipping_cost,
    round((cte.shipping_cost / NULLIF(cte.quantity, 0)),2) AS shipping_cost_per_unit,
    round((cte.profit / NULLIF(cte.quantity, 0)),2) AS profit_per_unit

FROM cte
left join {{ref("customer_order_det")}} c
on cte.customer_id=c.customer_id
left join {{ref("stg_product")}} p
on p.product_id=cte.product_id