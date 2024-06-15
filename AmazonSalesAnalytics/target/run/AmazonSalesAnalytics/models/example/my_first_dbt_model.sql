
  
    

   

    USE [amazonsalesanalytics];
    
    

    EXEC('create view "dwh"."my_first_dbt_model_temp_view" as /*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/



with source_data as (

    select 1 as id
    union all
    select null as id

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null;');



    
      EXEC('SELECT * INTO [amazonsalesanalytics].[dwh].[my_first_dbt_model] FROM [amazonsalesanalytics].[dwh].[my_first_dbt_model_temp_view];');
    

    
      
      
    
    USE [amazonsalesanalytics];
    EXEC('DROP view IF EXISTS "dwh"."my_first_dbt_model_temp_view";');



  