select 
    "shipping_id" :: integer shipping_id,
    "order_id" :: varchar(16) order_id,
    "shipping_date" :: timestamp ship_date,
    "ship_mode" :: varchar(16) ship_mode,
    "city" :: varchar(64) city,
    "state" :: varchar(64) state,
    "country" :: varchar(32) country,
    "region" :: varchar(16) region

from {{ source('staging','shipping') }}