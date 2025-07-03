{{
    config(
        materialized='incremental',
        unique_key='customer_id',
        on_schema_change = 'fail'
    )
}}

select 
    customer_id,
    customer_name,
    customer_email,
    registration_date
from airbnb.raw.customer

{% if is_incremental() %}
where registration_date > (select max(registration_date) from {{this}})

{% endif%}
