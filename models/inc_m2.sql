{{
    config(
        materialized = 'incremental'
    )
}}
select * from {{source('s1', 'tt_inc')}}