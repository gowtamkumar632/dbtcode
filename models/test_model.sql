{{

    config(
        materialized = 'table',
        transient  = false
    )
}}

select * from {{source('s1', 't_emp')}}