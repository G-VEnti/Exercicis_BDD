-- Inserts per al zoo
INSERT INTO zoo (nom, ciutat, pais, pressupost, grandaria) 
    VALUES
        ('Zoològic de Barcelona', 'Barcelona', 'Espanya', 2500000.50, 50000),
        ('Parc Zoològic de Madrid', 'Madrid', 'Espanya', 3200000.75, 75000),
        ('Zoo Aquarium de València', 'València', 'Espanya', 1800000.25, 35000),
        ('Parc de la Ciutadella', 'Barcelona', 'Espanya', 950000.00, 25000),
        ('Bioparc València', 'València', 'Espanya', 4200000.80, 90000);

-- Inserts per a l'espècie
INSERT INTO especie (nom_vulgar, nom_cientific, familia, en_perill_extincio)
    VALUES
        ('Lleó', 'Panthera leo', 'Felins', FALSE),
        ('Tigre', 'Panthera tigris', 'Felins', TRUE),
        ('Elefant africà', 'Loxodonta africana', 'Elefàntids', TRUE),
        ('Goril·la de muntanya', 'Gorilla beringei beringei', 'Homínids', TRUE),
        ('Dofí mular', 'Tursiops truncatus', 'Delfínids', FALSE);

-- Inserts per a l'animal
INSERT INTO animal (num_identificacio, sexe, any_naixement, pais_origen, continent, id_zoo, id_especie) 
    VALUES
        (1001, 'Masculi', '2018', 'Sud-àfrica', 'Àfrica', 1, 1),
        (1002, 'Femeni', '2019', 'Índia', 'Àsia', 2, 2),
        (1003, 'Femeni', '2015', 'Kenia', 'Àfrica', 3, 3),
        (1004, 'Masculi', '2017', 'Ruanda', 'Àfrica', 4, 4),
        (1005, 'Femeni', '2020', 'Espanya', 'Europa', 5, 5);