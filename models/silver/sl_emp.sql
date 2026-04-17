{{ config(materialized='table') }}

select
    empno,
    deptno,
    sal,
    case 
        when sal > 5000 then 'HIGH'
        else 'LOW'
    end as salary_band
from {{ ref('s1_emp') }}