/*
DROP ROLE dbadmin;
DROP DATABASE sampledb;
*/

CREATE ROLE dbadmin
    LOGIN
    CREATEDB
    CREATEROLE
    PASSWORD 'Welcome1';

\c postgres dbadmin

CREATE DATABASE sampledb
    OWNER dbadmin
    ENCODING 'UTF8'
    LC_COLLATE='en_US.UTF-8'
    LC_CTYPE='en_US.UTF-8'
    TEMPLATE template0;
	
\c sampledb dbadmin

CREATE SCHEMA hr AUTHORIZATION dbadmin;
CREATE SCHEMA sh AUTHORIZATION dbadmin;
