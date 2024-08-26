WITH customer_returns AS (
    SELECT
        o.customer_id,
        BOOL_OR(r.order_id IS NOT NULL) AS has_returned
    FROM {{ ref("stg_order") }} o
    LEFT JOIN {{ ref("stg_returned") }} r
    ON o.order_id = r.order_id
    GROUP BY o.customer_id
),

customer_order_dates AS (
    SELECT
        o.customer_id,
        MIN(o.order_date) AS first_order_date,
        MAX(o.order_date) AS last_order_date
    FROM {{ref("stg_order")}} o
    GROUP BY 1
),

market_counts AS (
    SELECT
        o.customer_id,
        o.market,
        COUNT(o.order_id) AS market_count
    FROM {{ ref("stg_order") }} o
    GROUP BY o.customer_id, o.market
),

customer_most_frequent_market AS (
    SELECT
    customer_id,
    market AS most_frequent_market  
    FROM(
        SELECT
            customer_id,
            market,
            market_count,
            ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY market_count DESC) AS rank
        FROM market_counts
    ) t 
    WHERE rank=1
)


SELECT
    c.customer_id,
    c.customer_name,
    c.age,
    c.segment AS customer_segment,
    c.marketing_channel,
    cd.first_order_date,
    cd.last_order_date,
    cm.most_frequent_market,
    cr.has_returned

FROM {{ref("stg_customer")}} c
--join with customer returns (1st CTE) 
LEFT JOIN customer_returns cr
ON c.customer_id = cr.customer_id
--join with customer_order_dates (2nd CTE)
LEFT JOIN customer_order_dates cd
ON c.customer_id=cd.customer_id
--join with customer_most_frequent_market (3rd CTE)
LEFT JOIN customer_most_frequent_market cm 
ON cm.customer_id=c.customer_id