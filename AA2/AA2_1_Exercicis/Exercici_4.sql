CREATE DATABASE treballadors;

USE treballadors;

CREATE TABLE regions
(
nom_regio VARCHAR(20),
PRIMARY KEY (nom_regio)
);


CREATE TABLE provincies
(
codi_p CHAR(4),
nom VARCHAR(20),
nom_regio VARCHAR(20),
PRIMARY KEY (codi_p),
FOREIGN KEY (nom_regio) REFERENCES regions(nom_regio)
);


CREATE TABLE localitats
(
codi_l CHAR(4),
nom VARCHAR(20),
codi_p CHAR(4),
PRIMARY KEY (codi_l),
FOREIGN KEY (codi_p) REFERENCES provincies(codi_p)
);


CREATE TABLE empleats
(
id_e CHAR(5),
dni_e CHAR(9),
nom VARCHAR(20),
telefon CHAR(9),
salari INT,
codi_l CHAR(4),
PRIMARY KEY (id_e),
FOREIGN KEY (codi_l) REFERENCES localitats(codi_l)
);




DESCRIBE empleats;
DESCRIBE localitats;
DESCRIBE provincies;
DESCRIBE regions;
