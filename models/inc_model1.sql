{{

    config(
        materialized = 'incremental',
        unique_key = 'id'
    )
}}

select * from {{ source('s1', 'tt_inc') }}

{% if is_incremental() %}
    where updated_time > (select max(updated_time) from {{ this }})
{% endif %}