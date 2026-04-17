{{
    config(
        materialized = 'incremental',
        unique_key = 'empno'
    )
}}

select * from {{ source('s1', 't_emp') }}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where update_date > (select max(update_date) from {{ this }}) 
{% endif %}

