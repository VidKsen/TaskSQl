SELECT constraint_name, table_name
FROM information_schema.table_constraints
WHERE table_schema = 'public' and constraint_type = 'PRIMARY KEY';