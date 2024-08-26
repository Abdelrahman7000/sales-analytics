WITH date_range AS (
    SELECT
        generate_series(
            (SELECT MIN(order_date) FROM {{ ref("order_shipping_det") }}),
            (SELECT MAX(ship_date) FROM {{ ref("order_shipping_det") }}),
            '1 day'::interval
        )::date AS date
),

date_attributes AS (
    SELECT
        date AS date_key,
        date :: timestamp,
        {{ extract_date_parts('date') }}
    FROM date_range
)

SELECT *
FROM date_attributes
