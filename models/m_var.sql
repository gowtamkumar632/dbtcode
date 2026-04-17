select *
from {{ source('s1', 't_emp') }}

{% if var("cond1") == "dept" %}
    where deptno = {{ var("cond2") }}

{% elif var("cond1") == "job" %}
    where job = '{{ var("cond2", "CLERK") }}'

{% else %}
    where sal > 5000
{% endif %}