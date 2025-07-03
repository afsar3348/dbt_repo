{{
    config(
        materialized = 'view'
    )
}}

WITH changing_host_name AS (
    SELECT
        *
    FROM
       {{ ref('src_hosts') }}
)
SELECT
    host_id,
    NVL(
        host_name,
        'Anonymous'
    ) AS host_name,
    NVL(
        is_superhost,
        'None'
    ) AS is_superhost,
    created_at,
    updated_at
FROM changing_host_name
    
    