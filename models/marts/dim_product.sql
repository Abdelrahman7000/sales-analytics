WITH market_counts AS (
    SELECT
        od.product_id,
        o.market,
        COUNT(od.order_id) AS market_count
    FROM {{ ref("stg_order_detail") }} od
    JOIN {{ ref(("order_shipping_det")) }} o
    ON od.order_id = o.order_id
    GROUP BY 1,2
),
ranked_markets AS (
    SELECT
        product_id,
        market,
        market_count,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY market_count DESC) AS rank
    FROM market_counts
)

SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.sub_category,
    rm.market AS product_most_frequent_market
FROM {{ ref("stg_product") }} p
LEFT JOIN ranked_markets rm
ON p.product_id = rm.product_id
WHERE rm.rank = 1
