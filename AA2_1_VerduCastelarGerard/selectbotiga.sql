--1
SELECT nom, cognoms FROM clients;

--2
SELECT * FROM productes
    WHERE descripcio LIKE '%eco%';

--3
SELECT * FROM valoracions
    ORDER BY puntuacio DESC LIMIT 1;

--4
SELECT * FROM comandes
    WHERE MONTH(data)=10;

--5
SELECT id_client, COUNT(id_client) FROM valoracions GROUP BY id_client;

--6
SELECT proveidors.nom, AVG(productes.estoc) FROM proveidors
    JOIN productes ON proveidors.id=productes.id_proveidor
        GROUP BY proveidors.nom;

--7
SELECT categories.nom, COUNT(productes_categories.id_categoria) FROM categories
    JOIN productes_categories ON categories.id=productes_categories.id_categoria
        GROUP BY productes_categories.id_categoria
            HAVING COUNT(productes_categories.id_categoria)>2;

--8
SELECT clients.nom, COUNT(valoracions.id_producte) FROM clients
    JOIN valoracions ON clients.id=valoracions.id_client
        GROUP BY clients.nom;

--9
