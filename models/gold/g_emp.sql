{{ config(materialized='table') }}

select
    deptno,
    count(*) as emp_count,
    sum(sal) as total_sal
from {{ ref('sl_emp') }}
group by deptno