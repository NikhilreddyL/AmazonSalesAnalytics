
  
    

   

    USE [amazonsalesanalytics];
    
    

    EXEC('create view "dwh"."dim_product_target_temp_view" as -- models/target/dim_product.sql


    insert into dwh.dim_product
    select * from "analytics-raw"."dwh"."dim_product"
;');



    
      EXEC('SELECT * INTO [amazonsalesanalytics].[dwh].[dim_product_target] FROM [amazonsalesanalytics].[dwh].[dim_product_target_temp_view];');
    

    
      
      
    
    USE [amazonsalesanalytics];
    EXEC('DROP view IF EXISTS "dwh"."dim_product_target_temp_view";');



  