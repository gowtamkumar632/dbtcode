{{
    config(
        materialized = 'incremental',
        unique_key = 'id',
        on_schema_change = 'append_new_columns'
    )
}}

select * from {{source('s1', 'tt_inc1')}}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where updated_time > (select max(updated_time) from {{ this }}) 
{% endif %}