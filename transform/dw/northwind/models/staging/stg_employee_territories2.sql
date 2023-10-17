{{ dbt_utils.deduplicate(
    relation=source('raw', 'employee_territories'),
    partition_by='employee_id',
    order_by='territory_id',
   )
}}