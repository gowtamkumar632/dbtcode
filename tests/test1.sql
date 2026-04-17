select empno, count(*) as cnt
from {{ ref('tt_emp') }}
group by empno
having count(*) > 1