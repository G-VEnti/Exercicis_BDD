CREATE TABLE mecanics
(
    dni CHAR(9),
    nom VARCHAR(20),
    edat INT,
    PRIMARY KEY (dni)
);

CREATE TABLE vehicles
(
    matricula CHAR(8),
    propietari VARCHAR(20),
    marca VARCHAR(20),
    reparat_per CHAR(9),
    PRIMARY KEY (matricula),
    FOREIGN KEY (reparat_per) REFERENCES mecanics(dni)
        ON UPDATE SET NULL
        ON DELETE SET NULL
);


INSERT INTO mecanics (dni, nom, edat) VALUES 
('12345678A', 'Joan Martínez', 35),
('87654321B', 'Maria García', 42);

INSERT INTO vehicles (matricula, propietari, marca, reparat_per) VALUES
('1234BCD', 'Pere Rodríguez', 'Seat', '12345678A'),
('5678EFG', 'Anna López', 'Ford', '87654321B');

UPDATE mecanics SET dni='11111111C'
    WHERE dni='12345678A';

DELETE FROM vehicles
    WHERE matricula='1234BCD';

--Funcionen totes les consultes menys la del update,
--ja que al intentar modificar un camp que es la foreign key d'una altre taula produeix un error.