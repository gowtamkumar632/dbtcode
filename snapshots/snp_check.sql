{% snapshot snp_check %}
    {{
        config(
            target_schema='ACCOUNT_SCHEMA',
            target_database='HDFC_DB',
            strategy='check',
            unique_key='id',
            check_cols = ['id', 'address']
        )
    }}

    select * from {{ source('s1', 'tt_check') }}
 {% endsnapshot %}