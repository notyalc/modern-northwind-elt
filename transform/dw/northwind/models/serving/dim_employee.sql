with stg_employees as (
   select
       "employee_id"
       , "address"
       , "birth_date"
       , "city"
       , "country"
       , "extension"
       , "hire_date"
       , "home_phone"
       , "notes"
       , "photo"
       , "photo_path"
       , "postal_code"
       , "region"
       , "reports_to"
       , "title"
       , "title_of_courtesy"
       , concat(coalesce(first_name,''),'  ',coalesce(last_name,'')) as employee_fullname
   from {{ref('stg_employees')}}
)


, stg_territories as (
   select *
   from {{ ref('stg_territories')}}
)


, stg_employee_territories as (
   select *
   from {{ ref('stg_employee_territories')}}
)


, transformed as (
   select
       {{ dbt_utils.generate_surrogate_key(['stg_employees.employee_id']) }} as employee_id_key -- surrogate key
       , stg_employees.employee_id as employee_id-- natural key of original table
       , stg_employees.employee_fullname
       , stg_employees.birth_date as employee_birth_date
       , stg_employees.city as employee_city
       , stg_employees.country as employee_country
       , stg_employees.extension as employee_extension
       , stg_employees.hire_date as employee_hire_date
       , stg_employees.home_phone as employee_home_phone
       , stg_employees.notes as employee_notes
       , stg_employees.photo as employee_photo
       , stg_employees.photo_path as employee_photo_path
       , stg_employees.postal_code as employee_postal_code
       , stg_employees.region as employee_region
       , stg_employees.reports_to as employee_reports
       , stg_employees.title as employee_title
       , stg_employees.title_of_courtesy as employee_title_of_courtesy
       , stg_territories.territory_id as employee_territory_id
       , stg_territories.territory_description as employee_territory_description
       , stg_territories.region_id as employee_region_id
       , stg_employee_territories.territory_id
   from stg_employees
   left join (stg_employee_territories left join stg_territories on stg_employee_territories.territory_id = stg_territories.territory_id)
   on stg_employees.employee_id = stg_employee_territories.employee_id
  )


select *
from transformed



