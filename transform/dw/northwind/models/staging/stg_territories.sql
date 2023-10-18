{{
    config(
        materialized='table',
        database='northwind',
        schema='staging'
    )
}}

with source_data as (
    select
        "territory_id"
        , "region_id"
        , "territory_description"
    from {{ source('raw', 'territories') }}
)
select *
from source_data