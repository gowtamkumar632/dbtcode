{{ config(materialized='view') }}

select 
    empno,
    ename,
    deptno,
    sal
from {{source('s1', 't_emp')}}