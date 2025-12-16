CREATE TABLE categories
(
    id INT AUTO_INCREMENT,
    nom VARCHAR(20),
);


CREATE TABLE proveidors
(
    id INT AUTO_INCREMENT,
    nom VARCHAR(20),
    correu VARCHAR(50),
    telefon CHAR(9),
    PRIMARY KEY (id)
);


CREATE TABLE clients
(
    id INT AUTO_INCREMENT,
    nom VARCHAR(20),
    cognoms VARCHAR (50),
    adreça VARCHAR (50),
    correu VARCHAR (50),
);


CREATE TABLE productes
(
    id INT AUTO_INCREMENT,
    nom VARCHAR(20),
    descripcio VARCHAR(100),
    estoc INT,
    id_proveidor,
    PRIMARY KEY (id),
    FOREIGN KEY (id_proveidor) REFERENCES proveidors(id)
);



CREATE TABLE descomptes
(
    id INT AUTO_INCREMENT,
    percentatge FLOAT,
    data_inici DATE,
    data_final DATE,
    PRIMARY KEY (id)
);


CREATE TABLE comandes
(
    id INT AUTO_INCREMENT,
    data DATE,
    import_total FLOAT,
    estat ENUM ('Enviada', 'Per enviar')
    id_client INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_client) REFERENCES clients(id)
);


CREATE TABLE productes_categories
(
    id_producte INT,
    id_categoria INT,
    PRIMARY KEY (id_producte, id_categoria),
    FOREIGN KEY (id_producte) REFERENCES productes(id),
    FOREIGN KEY (id_categoria) REFERENCES categories(id),
);


CREATE TABLE productes_descomptes
(
    id_producte INT,
    id_descompte INT,
    PRIMARY KEY (id_producte, id_descompte),
    FOREIGN KEY (id_producte) REFERENCES productes(id),
    FOREIGN KEY (id_descompte) REFERENCES descomptes(id),
);


CREATE TABLE comandes_productes
(
    id_comanda INT,
    id_producte INT,
    quantitat INT,
    PRIMARY KEY (id_comanda, id_producte),
    FOREIGN KEY (id_comanda) REFERENCES comandes(id),
    FOREIGN KEY (id_producte) REFERENCES productes(id),
);


CREATE TABLE valoracions
(
    id_producte INT,
    id_client INT,
    puntuacio FLOAT,
    comentari VARCHAR(100),
    data DATE,
    PRIMARY KEY (id_producte, id_client),
    FOREIGN KEY (id_producte) REFERENCES productes(id),
    FOREIGN KEY (id_client) REFERENCES clients(id)
);



DESCRIBE categories;
DESCRIBE proveidors;
DESCRIBE clients;
DESCRIBE productes;
DESCRIBE descomptes;
DESCRIBE comandes;
DESCRIBE productes_categories;
DESCRIBE productes_descomptes;
DESCRIBE comandes_productes;
DESCRIBE valoracions;