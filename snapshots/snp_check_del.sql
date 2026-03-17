{% snapshot snp_check_del %}
    {{
        config(

                target_database  = 'HDFC_DB',
                target_schema = 'ACCOUNT_SCHEMA',
                strategy = 'check',
                unique_key = 'id',
                check_cols = ['address'],
                invalidate_hard_deletes = false

        )
    }}

    select * from {{ source('s1', 'tt_check') }}
 {% endsnapshot %}