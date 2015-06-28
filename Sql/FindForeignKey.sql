-- Attempt to Find All Foreign Key Relationships Given A Column Name
declare @PrimaryKey nvarchar(50) = 'ColumnNameToFindForeignKeys'

-- Find By Schema
select
     pk.table_name          pk_table
    ,pkc.column_name        pk_column
    ,fkc.table_name         fk_table
    ,fkc.column_name        fk_column
    ,fk.constraint_name
from
    information_schema.table_constraints                 pk         -- all primary keys (filter below)
    join information_schema.key_column_usage             pkc        on (pk.constraint_name = pkc.constraint_name) -- join columns used in PK
    join information_schema.referential_constraints      fk         on (pk.constraint_name = fk.unique_constraint_name) -- join foreign keys that reference the PKs
    join information_schema.key_column_usage             fkc        on (fk.constraint_name = fkc.constraint_name) -- join columns in FK
where
    pk.constraint_type = 'PRIMARY KEY'
    and pkc.column_name = @PrimaryKey
order by
    1,2,3


-- Find By Naming Convention
select
     tb.TABLE_NAME
    ,cl.COLUMN_NAME
from
    INFORMATION_SCHEMA.COLUMNS                          cl
    left join INFORMATION_SCHEMA.tables                 tb        on (cl.TABLE_NAME = tb.TABLE_NAME)
where
    cl.TABLE_SCHEMA = 'dbo'
    and tb.TABLE_SCHEMA = 'dbo'
    and tb.TABLE_TYPE = 'BASE TABLE'
    and cl.Column_name = @PrimaryKey
	-- and cl.Column_name like '%' + @PrimaryKey + '%'
order by
    1, 2
