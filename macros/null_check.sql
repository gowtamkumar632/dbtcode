{% macro check_nulls(relation) %} 
{% set cols = adapter.get_columns_in_relation(relation) %} 
select {% for col in cols %} sum(case when {{ col.name }} is null then 1 else 0 end) as {{ col.name }}_nulls {% if not loop.last %}, {% endif %} {% endfor %} 
from {{ relation }} {% endmacro %}