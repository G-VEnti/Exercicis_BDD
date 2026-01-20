CREATE DATABASE animals_exposats;

USE animals_exposats;


CREATE TABLE zoo
(
	id_zoo INT AUTO_INCREMENT,
	nom VARCHAR(20),
	ciutat VARCHAR(20),
	pais VARCHAR(20),
	pressupost DOUBLE,
	grandaria INT,
	PRIMARY KEY (id_zoo),
	CONSTRAINT chk_zoo CHECK (grandaria BETWEEN 1000 AND 1000000)
);


CREATE TABLE especie
(
	id_especie INT AUTO_INCREMENT,
	nom_vulgar VARCHAR(20),
	nom_cientific VARCHAR(50),
	familia VARCHAR(20),
	en_perill_extincio BOOL,
	PRIMARY KEY (id_especie)
);


CREATE TABLE animal
(
	id_animal INT AUTO_INCREMENT,
	num_identificacio INT,
	sexe ENUM ('Masculi', 'Femeni'),
	any_naixement CHAR(4),
	pais_origen VARCHAR(20),
	continent VARCHAR(9),
	id_zoo INT,
	id_especie INT,
	PRIMARY KEY (id_animal),
	CONSTRAINT fk_zoo FOREIGN KEY (id_zoo) REFERENCES zoo(id_zoo),
	CONSTRAINT fk_especie FOREIGN KEY (id_especie) REFERENCES especie(id_especie)
);


DESCRIBE zoo;
DESCRIBE especie;
DESCRIBE animal;
