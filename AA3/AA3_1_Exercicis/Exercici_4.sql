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

-- a) Creació de l'usuari amb la IP de la máquina que volem conectar (client)
CREATE USER ganon@172.31.98.123;

-- Mostra tots els usuaris actuals
SELECT user,host FROM mysql.user;

-- b) Li donem els poders de SELECT per a totes les taules de la base de dades
-- Amb el nom del usuari i la ip del client
GRANT SELECT ON hyrule.* TO ganon@172.31.98.123;

-- c) Conexió del usuari al servidor mitjançant la IP del servidor
\connect ganon@192.168.56.101;

-- Mostra els permisos de l'usuari conectat
SHOW GRANTS;

-- d) Li treiem el permís de SELECT
REVOKE SELECT ON hyrule.* FROM ganon@172.31.98.123;

-- Mostra els permisos del usuari
SHOW GRANTS FOR ganon@172.31.98.123;

-- e) Creació d'una nova taula
CREATE DATABASE nova_bd;

USE novabd;

GRANT CREATE ON novabd.* TO ganon@172.31.98.123;

-- f) No pots consultar la informació de les taules prequè nomes te permisos de creació de taules
CREATE TABLE nova_taula
(
    id INT,
    a INT,
    b INT,
    PRIMARY KEY(id)
);

-- g) Eliminació del usuari creat
DROP USER ganon@172.31.98.123;

-- Comprobació dels usuaris de la BD
SELECT user,host FROM mysql.user;

-- h) Creació d'usuari i donació de permisos per a revisarlos
CREATE USER skullkid@'localhost';

GRANT CREATE USER ON *.* TO skullkid@'localhost'
GRANT SELECT (a,b) ON nova_bd.nova_taula TO skullkid@'localhost';

-- Permisos a nivell servidor (\G mostra les dades en vertical)
SELECT * FROM mysql.user
    WHERE user='skullkid' AND host='localhost'\G

-- Permisos a nivell bases de dades
SELECT * FROM mysql.db
    WHERE user='skullkid' AND host='localhost'\G

-- Permisos a nivell de taules
SELECT * FROM mysql.tables_priv
    WHERE user='skullkid' AND host='localhost'\G

-- Permisos a nivell de columnes
SELECT * FROM columns_priv
    WHERE user='skullkid' AND host='localhost'\G