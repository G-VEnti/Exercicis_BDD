DROP DATABASE IF EXISTS hyrule;
CREATE DATABASE hyrule;
USE hyrule;

CREATE TABLE herois (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nom VARCHAR(25),
	edat INT UNSIGNED
);

CREATE TABLE mascares (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nom VARCHAR(25),
	color VARCHAR(15)
);

CREATE TABLE armes (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nom VARCHAR(25),
	poder INT UNSIGNED
);

INSERT INTO herois (nom,edat) VALUES  ('superman', 352), ('spiderman', 21);
INSERT INTO mascares (nom, color) VALUES ('majora', 'marró'), ('rupies', 'verd');
INSERT INTO armes (nom, poder) VALUES ('espasa mestra', 100), ('arc', 40);


-- a)
CREATE USER navi@'localhost';

SHOW GRANTS FOR navi@'localhost';

-- b)
CREATE USER skullkid@'localhost' IDENTIFIED BY 'Majora';
   
SHOW GRANTS FOR skullkid@'localhost';

-- c)
GRANT SELECT hyrule.herois TO skullkid@'localhost';

\connect skullkid@'localhost';
Majora

SELECT * FROM hyrule.herois;

\disconnect;

-- d)
GRANT OPTION SELECT hyrule.* TO navi@'localhost';
GRANT OPTION INSERT hyrule.* TO navi@'localhost';
GRANT OPTION UPDATE hyrule.* TO navi@'localhost';

-- e)
\connect navi@'localhost';

GRANT SELECT hyrule.mascares to skullkid@'localhost';

\disconnect;

\connect skullkid@'localhost';

SELECT * FROM hyrule.mascares;

-- f)
\connect navi@'localhost';

REVOKE SELECT ON hyrule.herois FROM skullkid@'localhost';

-- g) Conectat desde root
REVOKE SELECT ON hyrule.mascares FROM skullkid@'localhost';

REVOKE SELECT, INSERT, UPDATE, GRANT OPTION ON hyrule.* FROM navi@'localhost';

-- h)
GRANT SELECT (id, nom) ON hyrule.armes TO skullkid@'localhost';

-- i)
\connect skullkid@'localhost';

SELECT * FROM hyrule.armes;

-- j)
DROP USER navi@'localhost';

-- Permisos a nivell servidor (\G mostra les dades en vertical)
SELECT * FROM mysql.user \G

-- Permisos a nivell bases de dades
SELECT * FROM mysql.db \G

-- Permisos a nivell de taules
SELECT * FROM mysql.tables_priv \G

-- Permisos a nivell de columnes
SELECT * FROM columns_priv \G