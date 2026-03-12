CREATE DATABASE empresa;
\c empresa;

--a)
CREATE TYPE adressa AS (
  carrer VARCHAR(20),
  ciutat VARCHAR(20),
  codi_postal CHAR(5)
);

--b)
CREATE TYPE persona AS (
  nom VARCHAR(20),
  casada BOOL,
  edat INTEGER,
  adreca adressa
);

--c)
CREATE TABLE treballadors (
  id SERIAL,
  usuari persona,
  sou INT,
  carrec VARCHAR(15),
  PRIMARY KEY (id)
);


INSERT INTO treballadors (usuari, sou, carrec) VALUES
     (ROW('Ramon', TRUE, 28, ROW('C/Nicaragua', 'Barcelona', '08029')), 600, 'President'),
     (ROW('Chucky', FALSE, 35, ROW('C/Numancia', 'Oviedo', '08050')), 0, 'Assassi'),
     (ROW('Shrek', TRUE, 40, ROW('C/Panta', 'Faraway', '08010')), 1200, 'Ogre');