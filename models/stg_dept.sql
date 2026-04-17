{{ config(materialized='view') }}

select 
    deptno,
    dname
from {{source('s1', 't_dept')}}