{% macro insert_into_target(source_model, target_schema, target_table) %}
    insert into {{ target_schema }}.{{ target_table }}
    select * from {{ ref(source_model) }}
{% endmacro %}
