{{ config(materialized='table') }}

select
    e.empno,
    e.ename,
    e.deptno,
    e.sal,
    d.dname,
    case 
        when e.sal > 5000 then 'HIGH'
        else 'LOW'
    end as salary_band
from {{ ref('stg_emp') }} e
left join {{ ref('stg_dept') }} d
  on e.deptno = d.deptno