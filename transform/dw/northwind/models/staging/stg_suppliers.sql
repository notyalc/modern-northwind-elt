{{
    config(
        materialized='table',
        database='northwind',
        schema='staging'
    )
}}

with source_data as (
    select
        "supplier_id"
        , "region"
        , "postal_code"
        , "address"
        , "city"
        , "company_name"
        , "contact_name"
        , "contact_title"
        , "country"
        , "fax"
        , "homepage"
        , "phone"
    from {{ source('raw', 'suppliers') }}
)
select *
from source_data