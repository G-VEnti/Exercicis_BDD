CREATE TABLE categories
(
    id INT AUTO_INCREMENT,
    nom VARCHAR(20),
    PRIMARY KEY (id)
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
    cognoms VARCHAR(50),
    adressa VARCHAR(50),
    correu VARCHAR(50),
    PRIMARY KEY (id)
);


CREATE TABLE productes
(
    id INT AUTO_INCREMENT,
    nom VARCHAR(20),
    descripcio VARCHAR(100),
    estoc INT,
    id_proveidor INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_id_proveidor FOREIGN KEY (id_proveidor) REFERENCES proveidors(id)
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
    estat ENUM ('Enviada', 'Per enviar'),
    id_client INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_id_client_c FOREIGN KEY (id_client) REFERENCES clients(id)
);


CREATE TABLE productes_categories
(
    id_producte INT,
    id_categoria INT,
    PRIMARY KEY (id_producte, id_categoria),
    CONSTRAINT fk_id_producte_pc FOREIGN KEY (id_producte) REFERENCES productes(id),
    CONSTRAINT fk_id_categoria FOREIGN KEY (id_categoria) REFERENCES categories(id)
);


CREATE TABLE productes_descomptes
(
    id_producte INT,
    id_descompte INT,
    PRIMARY KEY (id_producte, id_descompte),
    CONSTRAINT fk_id_producte_pd FOREIGN KEY (id_producte) REFERENCES productes(id),
    CONSTRAINT fk_id_descompte FOREIGN KEY (id_descompte) REFERENCES descomptes(id)
);


CREATE TABLE comandes_productes
(
    id_comanda INT,
    id_producte INT,
    quantitat INT,
    PRIMARY KEY (id_comanda, id_producte),
    CONSTRAINT fk_id_comanda_cp FOREIGN KEY (id_comanda) REFERENCES comandes(id),
    CONSTRAINT fk_id_producte_cp FOREIGN KEY (id_producte) REFERENCES productes(id)
);


CREATE TABLE valoracions
(
    id_producte INT,
    id_client INT,
    puntuacio FLOAT,
    comentari VARCHAR(100),
    data DATE,
    PRIMARY KEY (id_producte, id_client),
    CONSTRAINT fk_id_producte_v FOREIGN KEY (id_producte) REFERENCES productes(id),
    CONSTRAINT fk_id_client_v FOREIGN KEY (id_client) REFERENCES clients(id)
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