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


-- a) Crea dos rols, un anomenat ORNI amb tots els privilegis sobre la taula
-- herois i mascares i un altre anomenat GERUDO amb tots els privilegis
-- sobre la taula armes.
CREATE ROLE orni;
GRANT ALL PRIVILEGES ON herois, mascares TO orni;

CREATE ROLE gerudo;
GRANT ALL PRIVILEGES ON armes TO gerudo;

-- Comprovació creació rols

SELECT user FROM mysql.user;

SHOW GRANTS FOR orni;
SHOW GRANTS FOR gerudo;


-- b) Crea un usuari anomenat ganon i atorga-li el rol GERUDO per defecte.
CREATE USER ganon IDENTIFIED BY 'Alumne.123';
GRANT gerudo TO ganon;
SET DEFAULT ROLE gerudo TO ganon;

SHOW GRANT FOR ganon;


-- c) Connectat amb l'usuari ganon i prova d'executar una consulta sobre la
-- taula herois i una altra sobre la taula armes.
-- Conectat desde ganon:
SELECT * FROM hyrule.herois; -- Es denega la comanda
SELECT * FROM hyrule.armes  -- Funciona.


-- d) A continuació, des de root, atorga el rol ORNI a ganon i repeteix la
-- consulta sobre la taula armes amb l'usuari ganon.
-- Conectat desde root:
GRANT orni TO ganon;
-- Conectat desde ganon:
SELECT * FROM hyrule.armes;


-- e) Seguidament, amb l'usuari ganon activa el rol ORNI per a la sessió
-- actual (SET ROLE) i repeteix una altra vegada la consulta sobre la taula
-- armes.
-- Conectat des de ganon:
SET ROLE orni;
SELECT * FROM hyrule.armes;


-- f) Desactiva tots els rols de l'usuari ganon.
SET ROLE NONE;


-- g) Consulta la taula herois amb l'usuari ganon.
-- Conectat desde ganon:
SET ROLE orni;
SELECT * FROM hyrule.herois;