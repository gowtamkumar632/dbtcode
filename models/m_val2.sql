{% set conds = ['sal > 1000', 'deptno in (10,20)', "job = 'CLERK'"] %}

select empno, deptno, sal
from {{ source('s1', 't_emp') }}
where
{% for f in conds %}
    {{ f }}{% if not loop.last %} and {% endif %}
{% endfor %}