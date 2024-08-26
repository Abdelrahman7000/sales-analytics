{% macro extract_date_parts(date_column) %}

    EXTRACT(YEAR FROM {{ date_column }}) AS year,
    EXTRACT(QUARTER FROM {{ date_column }}) AS quarter,
    EXTRACT(MONTH FROM {{ date_column }}) AS month,
    EXTRACT(DAY FROM {{ date_column }}) AS day,
    TO_CHAR({{ date_column }}, 'Day') AS day_of_week,
    EXTRACT(WEEK FROM {{ date_column }}) AS week_of_year,
    CASE
        WHEN EXTRACT(DOW FROM {{ date_column }}) IN (0, 6) THEN TRUE
        ELSE FALSE
    END AS is_weekend,
    EXTRACT(DOY FROM {{ date_column }}) AS day_of_year,
    {{ date_column }} - INTERVAL '1 day' AS previous_day,
    {{ date_column }} + INTERVAL '1 day' AS next_day
{% endmacro %}
