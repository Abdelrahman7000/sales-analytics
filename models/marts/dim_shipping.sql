WITH cte AS(
    SELECT 
        s.shipping_id,
        s.ship_mode,
        s.city,
        s.state,
        s.country,
        s.region

    FROM {{ref("order_shipping_det")}} s
)

SELECT * 
FROM cte