SELECT
    customer_id,
    customer_name,
    age,
    customer_segment,
    marketing_channel,
    most_frequent_market,
    has_returned
    
FROM {{ref("customer_order_det")}}