select 
    "Product_ID" :: varchar(16) product_id,
    "Product_Name" :: varchar(128) product_name,
    "Category" :: varchar(16) category,
    "Sub_Category" :: varchar(16) sub_category

from {{ source('staging','product') }}