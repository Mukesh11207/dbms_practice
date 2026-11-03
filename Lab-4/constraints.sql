SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE FROM 
INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'EMPLOYEE'; 


SELECT table_schema, table_name, view_definition
FROM information_schema.views
WHERE table_schema = 'database_name';