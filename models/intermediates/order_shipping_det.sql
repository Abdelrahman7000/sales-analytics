
select *

from {{ref("stg_order")}} o 
join {{ref("stg_shipping")}} s using(order_id)