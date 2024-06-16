USE [amazonsalesanalytics];
    
    

    EXEC('create view "dwh"."dim_product_target" as -- models/target/dim_product_target.sql



insert into amazonsalesanalytics.dwh.dim_product
select * from "amazonsalesanalytics"."dwh"."dim_product";');


