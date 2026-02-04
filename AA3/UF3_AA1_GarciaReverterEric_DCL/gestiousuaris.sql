CREATE TABLE planetes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(20)
);

CREATE TABLE naus (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(20),
  capacitat INT
);

CREATE TABLE tripulants (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(20),
  carrec VARCHAR(20)
);

INSERT INTO planetes (nom) VALUES
     ('saturn'),
     ('jupiter'),
     ('mercuri');

INSERT INTO naus (nom, capacitat) VALUES
    ('Falcó Milenari', 30),
    ('Caça estelar', 2),
    ('Destructor imperial', 250);

INSERT INTO tripulants (nom, carrec) VALUES
    ('Han Solo', 'Pilot'),
    ('Luke Skywalker', 'Jedi'),
    ('Darth Vader', 'Sith');

CREATE USER alien@'localhost';

CREATE USER clark@127.0.0.1 IDENTIFIED BY 'kent';

GRANT SELECT, INSERT, UPDATE ON galaxia.* TO alien@'localhost';