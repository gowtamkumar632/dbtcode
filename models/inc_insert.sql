{{
    config(
        materialized = 'incremental',
        unique_key ='id'
    )
}}

select * from {{source('s1', 'tt_inc')}}