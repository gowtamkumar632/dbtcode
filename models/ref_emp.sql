{{

    config(

        materialized = 'ephemeral'
    )

}}
select * from {{ ref('emp_seed') }}