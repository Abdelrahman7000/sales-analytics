select 
    "Customer_ID" :: varchar(8) customer_id,
    "Customer_Name" :: varchar(32) customer_name,
    "age" :: integer age,
    "Segment" :: varchar(16) segment,
    "marketing_channel" :: varchar(30)
    

from {{ source('staging','customer') }}