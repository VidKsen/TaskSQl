select table_name, column_name
from information_schema.columns
where column_default like '%nextval%';