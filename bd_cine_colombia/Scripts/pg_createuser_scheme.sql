CREATE database cine;
CREATE USER cine WITH encrypted password 'cine';
GRANT ALL PRIVILEGES ON database cine TO cine;
ALTER DATABASE cine OWNER TO cine;