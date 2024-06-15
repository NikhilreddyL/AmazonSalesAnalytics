-- Use the `ref` function to select from other models

select *
from "amazonsalesanalytics"."dwh"."my_first_dbt_model"
where id = 1