select 
    "Order_ID" :: varchar(16) order_id,
    "Customer_ID" :: varchar(8) customer_id,
    "Order_Priority" :: varchar(8) order_priority,
    "Order_Date" :: timestamp order_date,
    "Market" :: varchar(8) market

from {{ source('staging','order') }}