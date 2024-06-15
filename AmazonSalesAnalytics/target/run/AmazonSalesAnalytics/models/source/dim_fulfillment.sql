
  
    

   

    USE [amazonsalesanalytics];
    
    

    EXEC('create view "dwh"."dim_fulfillment_temp_view" as 

with dim_fulfillment as (
    select 
        DISTINCT
        Fulfilment as FulfillmentType,
        [ship-service-level] as ShipServiceLevel,
        [fulfilled-by] as FulfilledBy
    from 
        raw.raw_data
)

select row_number() over(order by FulfillmentType, ShipServiceLevel, FulfilledBy) as FulfillmentID ,
        *
    from dim_fulfillment;');



    
      EXEC('SELECT * INTO [amazonsalesanalytics].[dwh].[dim_fulfillment] FROM [amazonsalesanalytics].[dwh].[dim_fulfillment_temp_view];');
    

    
      
      
    
    USE [amazonsalesanalytics];
    EXEC('DROP view IF EXISTS "dwh"."dim_fulfillment_temp_view";');



  