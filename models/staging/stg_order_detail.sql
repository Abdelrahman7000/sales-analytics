select
    "Row_ID" :: integer row_id,
    "Order_ID" :: varchar(16) order_id,
    "Product_ID" :: varchar(16) product_id,
    "Sales" :: decimal sales,
    "Quantity" :: integer quantity,
    "Discount" :: decimal discount,
    "Profit" :: decimal profit ,
    "Shipping_Cost" :: decimal shipping_cost
    
from {{ source('staging','order_detail') }}
