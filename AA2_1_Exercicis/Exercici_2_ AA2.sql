CREATE TABLE mecanics
(
dni CHAR(9),
nom VARCHAR(20),
edat CHAR(2),
PRIMARY KEY (dni)
);


CREATE TABLE vehicles
(
matricula CHAR(7),
propietari VARCHAR(20),
marca VARCHAR(20),
reparat_per CHAR(9),
PRIMARY KEY (matricula),
FOREIGN KEY (reparat_per) REFERENCES mecanics(dni)
);