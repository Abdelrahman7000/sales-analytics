with source as (
      select * from {{ source('staging', 'shipping') }}
),
renamed as (
    select
        {{ adapter.quote("shipping_id") }},
        {{ adapter.quote("order_id") }},
        {{ adapter.quote("shipping_date") }},
        {{ adapter.quote("ship_mode") }},
        {{ adapter.quote("city") }},
        {{ adapter.quote("state") }},
        {{ adapter.quote("country") }},
        {{ adapter.quote("region") }}

    from source
)
select * from renamed
  