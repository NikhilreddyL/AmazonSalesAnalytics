-- models/target/dim_product.sql


    insert into dwh.dim_product
    select * from "analytics-raw"."dwh"."dim_product"
