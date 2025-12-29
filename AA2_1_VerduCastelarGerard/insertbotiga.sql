INSERT INTO categories (nom, descripcio) VALUES
('Electrònica', 'Dispositius electrònics i gadgets'),
('Roba', 'Peces de vestir per a totes les edats'),
('Llar', 'Articles per a la llar i decoració'),
('Esports', 'Equipament esportiu i accessoris'),
('Llibres', 'Llibres de tota mena de gèneres');

INSERT INTO proveidors (nom, correu, telefon) VALUES
('TechPro S.L.', 'info@techpro.cat', '931234567'),
('ModaTotal', 'ventes@modatotal.cat', '932345678'),
('LlarExpress', 'contacte@llarexpress.cat', '934567890'),
('EsportsMax', 'comandes@esportsmax.cat', '936789012'),
('LlibresCultura', 'atencio@llibrescultura.cat', '938901234');

INSERT INTO clients (nom, cognoms, adressa, correu) VALUES
('Joan', 'Garcia López', 'Carrer Major 123, Barcelona', 'joan.garcia@email.cat'),
('Maria', 'Martínez Solé', 'Avinguda Diagonal 456, Lleida', 'maria.martinez@email.cat'),
('Pere', 'Fernàndez Costa', 'Plaça Catalunya 789, Girona', 'pere.fernandez@email.cat'),
('Anna', 'Rodríguez Puig', 'Carrer Sant Joan 10, Tarragona', 'anna.rodriguez@email.cat'),
('Marc', 'Sànchez Navarro', 'Rambla 25, Reus', 'marc.sanchez@email.cat');

INSERT INTO productes (nom, descripcio, estoc, id_proveidor) VALUES
('Telèfon', 'Telèfon Android amb pantalla de 6.5"', 3, 1),
('Samarreta cotó', 'Samarreta de cotó eco talla M', 200, 2),
('Rentadora', 'Rentadora de càrrega frontal 8kg', 30, 3),
('Pilota de futbol', 'Pilota oficial mida 5', 4, 4),
('Novel·la històrica', 'Novel·la ambientada al segle XV', 150, 5);

INSERT INTO descomptes (percentatge, data_inici, data_final) VALUES
(10.5, '2024-01-01', '2024-01-31'),
(25.0, '2024-02-01', '2024-02-28'),
(15.0, '2024-03-01', '2024-03-15'),
(30.0, '2024-06-01', '2024-06-30'),
(5.0, '2024-11-01', '2024-11-30');

INSERT INTO comandes (data, import_total, estat, id_client) VALUES
('2024-01-15', 599.99, 'Enviada', 1),
('2024-10-20', 89.50, 'Per enviar', 2),
('2024-10-10', 450.00, 'Enviada', 3),
('2024-02-25', 120.75, 'Per enviar', 4),
('2024-03-05', 299.99, 'Enviada', 5);

INSERT INTO productes_categories (id_producte, id_categoria) VALUES
(1, 1), -- Telèfon → Electrònica
(2, 2), -- Samarreta → Roba
(3, 3), -- Rentadora → Llar
(4, 1), -- Pilota → Esports
(5, 5); -- Novel·la → Llibres

INSERT INTO productes_descomptes (id_producte, id_descompte) VALUES
(1, 1), -- Telèfon amb descompte 1
(2, 2), -- Samarreta amb descompte 2
(3, 3), -- Rentadora amb descompte 3
(4, 4), -- Pilota amb descompte 4
(5, 5); -- Llibre amb descompte 5

INSERT INTO comandes_productes (id_comanda, id_producte, quantitat) VALUES
(1, 1, 1),  -- Comanda 1: 1 telèfon
(2, 2, 3),  -- Comanda 2: 3 samarretes
(3, 3, 1),  -- Comanda 3: 1 rentadora
(4, 4, 2),  -- Comanda 4: 2 pilotes
(5, 5, 5);  -- Comanda 5: 5 llibres

INSERT INTO valoracions (id_producte, id_client, puntuacio, comentari, data) VALUES
(1, 1, 4.5, 'Molt bo, pantalla espectacular', '2024-01-20'),
(2, 2, 4.0, 'Còmode i de bona qualitat', '2024-01-25'),
(3, 3, 3.5, 'Funciona bé però fa soroll', '2024-02-15'),
(4, 4, 5.0, 'Perfecta per jugar al camp', '2024-02-28'),
(5, 5, 4.8, 'Història apassionant, molt ben escrita', '2024-03-10');

SELECT * FROM categories;
SELECT * FROM proveidors;
SELECT * FROM clients;
SELECT * FROM productes;
SELECT * FROM descomptes;
SELECT * FROM comandes;
SELECT * FROM productes_categories;
SELECT * FROM productes_descomptes;
SELECT * FROM comandes_productes;
SELECT * FROM valoracions;