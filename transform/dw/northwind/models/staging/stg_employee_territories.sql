with source_data as (
    select
        employee_id
        , territory_id
    from {{ source('raw', 'employee_territories') }}
)
select *
from source_data