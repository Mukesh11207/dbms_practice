REVOKE insert
ON COMPANY.EMPLOYEE
FROM 'user_b'@'localhost';
show grants for 'user_b'@'localhost';
