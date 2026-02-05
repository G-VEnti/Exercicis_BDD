CREATE DATABASE taller;

-- a)
CREATE TABLE mecanics (
 dni CHAR(9),
 nom VARCHAR(9),
 edat SMALLINT,
 poblacio VARCHAR(20),
PRIMARY KEY (dni)
);

-- b)
CREATE TABLE vehicles (
 matricula CHAR(7),
 propietari VARCHAR(20),
 marca VARCHAR(20),
 PRIMARY KEY (matricula)
);

CREATE TABLE reparacions (
 id SERIAL,
 dni_mecanic CHAR(9),
 matricula_vehicle CHAR(7),
 data DATE,
 PRIMARY KEY (id),
 FOREIGN KEY (dni_mecanic) REFERENCES mecanics(dni),
 FOREIGN KEY (matricula_vehicle) REFERENCES vehicles(matricula)
);

-- c)
INSERT INTO mecanics (dni, nom, edat, poblacio) VALUES
('45645645A', 'Ernest', 27, 'Manresa'),
('46946946P', 'Maria', 18, 'Barcelona'),
('47147147Z', 'Carla', 28, 'Barcelona'),
('48248248B', 'Jordi', 35, 'Girona');

INSERT INTO vehicles (matricula, propietari, marca) VALUES
('1121JKL', 'Laura', 'BMW'),
('1234ABC', 'Pere', 'Ford'),
('3141MNO', 'Sofia', 'Mercedes');

INSERT INTO reparacions (dni_mecanic, matricula_vehicle, data) VALUES
('45645645A', '1234ABC', '2024-01-15'),
('46946946P', '1121JKL', '2024-02-20'),
('47147147Z', '3141MNO', '2024-03-10'),
('48248248B', NULL, '2024-07-15');
