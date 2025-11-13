CREATE DATABASE procuradors;

USE procuradors;

CREATE TABLE client
(
	id_client INT AUTO_INCREMENT,
	dni_client CHAR(9),
	nom_client VARCHAR(20),
	adreça_client VARCHAR(30),
	PRIMARY KEY (id_client)
);

CREATE TABLE procurador
(
	id_procurador INT AUTO_INCREMENT,
	nom_procurador VARCHAR(20),
	adreça VARCHAR(30),
	dni_procurador CHAR(9),
	PRIMARY KEY (id_procurador)
);

CREATE TABLE assumpte
(
	id_assumpte INT AUTO_INCREMENT,
	periode VARCHAR(17),
	estat BOOL NOT NULL,
	id_client INT,
	PRIMARY KEY (id_assumpte),
	CONSTRAINT fk_client FOREIGN KEY (id_client) REFERENCES client(id_client)
);


CREATE TABLE portacio
(
	id_procurador INT,
	id_assumpte INT,
	PRIMARY KEY (id_procurador, id_assumpte),
	FOREIGN KEY (id_procurador) REFERENCES procurador(id_procurador),
	FOREIGN KEY (id_assumpte) REFERENCES assumpte(id_assumpte)
);

DESCRIBE procurador;
DESCRIBE assumpte;
DESCRIBE client;
DESCRIBE portacio;
