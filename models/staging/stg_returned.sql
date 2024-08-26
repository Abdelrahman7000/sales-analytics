select 
    "Order_ID" :: varchar(16) order_id

from {{ source('staging','returned') }}