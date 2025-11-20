CREATE DATABASE escola;

USE escola;

CREATE TABLE alumne
(
	num_matricula CHAR(7),
	nom VARCHAR(20),
	telefon CHAR(9),
	data_naixement DATE,
	PRIMARY KEY (num_matricula)
);



CREATE TABLE professor
(
	id_p CHAR(5),
	nif_p CHAR(9),
	nom VARCHAR(20),
	especialitat VARCHAR(20),
	telefon CHAR(9),
	PRIMARY KEY (id_p)
);



CREATE TABLE assignatura
(
	codi CHAR(10),
	nom VARCHAR(20),
	id_p_professor CHAR(5),
	PRIMARY KEY (codi),
	FOREIGN KEY (id_p_professor) REFERENCES professor(id_p)
);




-- MATRICULACIO (any_academic)

CREATE TABLE matriculacio
(
	any_academic CHAR(4),
	num_matricula_alumne CHAR(7),
	codi_assignatura CHAR(10),
	PRIMARY KEY (num_matricula_alumne, codi_assignatura),
	FOREIGN KEY (num_matricula_alumne) REFERENCES alumne(num_matricula),
	FOREIGN KEY (codi_assignatura) REFERENCES assignatura(codi)
);

DESCRIBE alumne;
DESCRIBE professor;
DESCRIBE assignatura;
DESCRIBE matriculacio;


