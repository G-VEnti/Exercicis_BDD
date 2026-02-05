-- a)
CREATE DATABASE exercicisDB;

CREATE TABLE desenvolupadors (
id INT,
nom VARCHAR(20),
CHECK (id > 0),
PRIMARY KEY (id)
);


-- b)
CREATE TABLE videojocs (
 id INT,
 nom VARCHAR(45),
 data_sortida DATE,
 genere VARCHAR(20),
 preu DECIMAL(6,2),
 img_portada BYTEA,
 id_desenvolupador INT,
 CHECK (id > 0),
 CHECK (id_desenvolupador > 0),
 CHECK (genere IN ('SURVIVAL', 'RPG', 'METROIDVANIA', 'ACTION ADVENTURE')),
 PRIMARY KEY (id),
 FOREIGN KEY (id_desenvolupador) REFERENCES desenvolupadors (id)
);

-- c)
INSERT INTO desenvolupadors (id, nom) VALUES
(1, 'Team Cherry'), (2, 'Konami'), (3, 'Valve');

INSERT INTO videojocs VALUES
(1, 'Hollow Knight', '2017-02-24', 'METROIDVANIA', 14.99, NULL, 1),
(2, 'Silent Hill 2', '2001-09-24', 'SURVIVAL', 49.99, NULL, 2),
(3, 'Portal', '2007-10-10', 'ACTION ADVENTURE', 19.99, NULL, 3);
