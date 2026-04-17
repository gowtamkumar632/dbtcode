{% test min_row_count(model, min_count) %}

select *
from (
    select count(*) as cnt
    from {{ model }}
) t
where cnt < {{ min_count }}

{% endtest %}