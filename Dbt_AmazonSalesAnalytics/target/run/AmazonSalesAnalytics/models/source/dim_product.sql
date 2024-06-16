
  
    

   

    USE [amazonsalesanalytics];
    
    

    EXEC('create view "dwh"."dim_product_temp_view" as 

with cte_product as 
        (
        SELECT
            distinct 
            SKU,
            Style,
            Category,
            SIZE,
            ASIN
        from RAW.raw_data
    )

--INSERT into dwh.dim_product
select row_number() over(order by SKU, Style, Category, SIZE, ASIN) as ProductID,
        *
     from cte_product;');



    
      EXEC('SELECT * INTO [amazonsalesanalytics].[dwh].[dim_product] FROM [amazonsalesanalytics].[dwh].[dim_product_temp_view];');
    

    
      
      
    
    USE [amazonsalesanalytics];
    EXEC('DROP view IF EXISTS "dwh"."dim_product_temp_view";');



  