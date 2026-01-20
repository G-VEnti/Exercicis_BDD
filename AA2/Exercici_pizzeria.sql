CREATE DATABASE pizzeria;

USE pizzeria;

CREATE TABLE clients
(
	dni CHAR(9),
	nom VARCHAR(20),
	adressa VARCHAR(50),
	telefon CHAR(9),
	PRIMARY KEY (dni)
);


CREATE TABLE comandes
(
	num_comanda CHAR(5),
	preu_total VARCHAR(4),
	data DATE,
	estat ENUM("Enviada","Per enviar"),
	dni_client CHAR(9),
	PRIMARY KEY (num_comanda),
	CONSTRAINT fk_dni_client FOREIGN KEY (dni_client) REFERENCES clients(dni)
);


CREATE TABLE pizzes
(
	id CHAR(4),
	nom VARCHAR(20),
	preu_base VARCHAR(4),
	PRIMARY KEY (id)
);


CREATE TABLE masses
(
	id CHAR(4),
	nom VARCHAR(20),
	preu VARCHAR(4),
	PRIMARY KEY (id)
);


CREATE TABLE alergogens
(
	id CHAR(4),
	nom VARCHAR(20),
	descripcio VARCHAR(50),
	PRIMARY KEY (id)
);


CREATE TABLE tipus_ingredients
(
	id CHAR(4),
	nom VARCHAR(20),
	descripcio VARCHAR(50),
	PRIMARY KEY (id)
);


CREATE TABLE ingredients
(
	id CHAR(4),
	nom VARCHAR(20),
	preu VARCHAR(4),
	id_tipus CHAR(4),
	PRIMARY KEY (id),
	CONSTRAINT fk_id_tipus FOREIGN KEY (id_tipus) REFERENCES tipus_ingredients(id)
);


CREATE TABLE pizzes_masses
(
	id_pizza CHAR(4),
	id_massa CHAR(4),
	PRIMARY KEY (id_pizza, id_massa),
	CONSTRAINT fk_id_pizza_masses FOREIGN KEY (id_pizza) REFERENCES pizzes(id),
	CONSTRAINT fk_id_massa FOREIGN KEY (id_massa) REFERENCES masses(id)
);


CREATE TABLE comandes_pizzes
(
	id_pizza CHAR(4),
	id_comandes CHAR(4),
	PRIMARY KEY (id_pizza, id_comandes),
	CONSTRAINT fk_id_pizza_comandes FOREIGN KEY (id_pizza) REFERENCES pizzes(id),
	CONSTRAINT fk_id_comandes FOREIGN KEY (id_comandes) REFERENCES comandes(num_comanda)
);


CREATE TABLE ingredients_alergogens
(
	id_ingredient CHAR(4),
	id_alergogen CHAR(4),
	PRIMARY KEY(id_ingredient, id_alergogen),
	CONSTRAINT fk_id_ingredient_alergogens FOREIGN KEY (id_ingredient) REFERENCES ingredients(id),
	CONSTRAINT fk_id_alergogens FOREIGN KEY (id_alergogen) REFERENCES alergogens(id)
);


CREATE TABLE pizzes_ingredients
(
	id_pizza CHAR(4),
	id_ingredient CHAR(4),
	grams_per_ingredient VARCHAR(3),
	PRIMARY KEY(id_pizza, id_ingredient),
	CONSTRAINT fk_id_pizza_ingredients FOREIGN KEY (id_pizza) REFERENCES pizzes(id),
	CONSTRAINT fk_id_ingredient_pizzes FOREIGN KEY (id_ingredient) REFERENCES ingredients(id)
);


SHOW CREATE TABLE clients;
SHOW CREATE TABLE comandes;
SHOW CREATE TABLE pizzes;
SHOW CREATE TABLE masses;
SHOW CREATE TABLE alergogens;
SHOW CREATE TABLE tipus_ingredients;
SHOW CREATE TABLE ingredients;
SHOW CREATE TABLE pizzes_masses;
SHOW CREATE TABLE comandes_pizzes;
SHOW CREATE TABLE ingredients_alergogens;
SHOW CREATE TABLE pizzes_ingredients;




ALTER TABLE comandes_pizzes
	DROP CONSTRAINT fk_id_comandes;
	
ALTER TABLE comandes_pizzes
	MODIFY id_comandes INT;
	
ALTER TABLE comandes
	MODIFY num_comanda INT AUTO_INCREMENT;
	
ALTER TABLE comandes_pizzes
	ADD CONSTRAINT fk_id_comandes 
		FOREIGN KEY (id_comandes) REFERENCES comandes(num_comanda);



ALTER TABLE pizzes_masses
	DROP CONSTRAINT fk_id_pizza_masses;

ALTER TABLE pizzes_masses
	MODIFY id_pizza INT;

ALTER TABLE pizzes
	MODIFY id INT AUTO_INCREMENT;
	
ALTER TABLE pizzes_masses
	ADD CONSTRAINT fk_id_pizza_masses
		FOREIGN KEY (id_pizza) REFERENCES pizzes(id);



ALTER TABLE pizzes_masses
	DROP CONSTRAINT fk_id_massa;

ALTER TABLE pizzes_masses
	MODIFY id_massa INT;

ALTER TABLE masses
	MODIFY id INT AUTO_INCREMENT;
	
ALTER TABLE pizzes_masses
	ADD CONSTRAINT fk_id_massa
		FOREIGN KEY (id_massa) REFERENCES masses(id);



ALTER TABLE ingredients_alergogens
	DROP CONSTRAINT fk_id_alergogens;

ALTER TABLE ingredients_alergogens
	MODIFY id_alergogen INT;
	
ALTER TABLE alergogens
	MODIFY id INT AUTO_INCREMENT;

ALTER TABLE ingredients_alergogens
	ADD CONSTRAINT fk_id_alergogens
		FOREIGN KEY (id_alergogen) REFERENCES alergogens(id);



ALTER TABLE ingredients
	DROP CONSTRAINT fk_id_tipus;

ALTER TABLE ingredients
	MODIFY id_tipus INT;

ALTER TABLE tipus_ingredients
	MODIFY id INT AUTO_INCREMENT;

ALTER TABLE ingredients
	ADD CONSTRAINT fk_id_tipus 
		FOREIGN KEY (id_tipus) REFERENCES tipus_ingredients(id);



ALTER TABLE ingredients_alergogens
	DROP CONSTRAINT fk_id_ingredient_alergogens;
	
ALTER TABLE ingredients_alergogens
	MODIFY id_ingredient INT;

ALTER TABLE  ingredients
	MODIFY id INT AUTO_INCREMENT;

ALTER TABLE ingredients_alergogens
	ADD CONSTRAINT fk_id_ingredient_alergogens
		FOREIGN KEY id_ingredient REFERENCES ingredients(id);




ALTER TABLE comandes
	MODIFY estat ENUM("en preparació", "lliurada", "cancel·lada");

ALTER TABLE pizzes_ingredients
	MODIFY grams_per_ingredient 
	
	
	
	
	
	
--1. Llista el nom, adreça i telèfon de tots els clients.

SELECT nom, adreça, telefon FROM clients;


--2. Llista totes les pizzes que tenen un preu base superior a 10 euros.

SELECT * FROM pizzes WHERE preu_base > 10;


--3. Mostra la pizza amb el preu base més car.
--SELECT * FROM pizzes WHERE preu_base = (SELECT MAX (preu_base) FROM pizzes);

SELECT * FROM pizzes
	ORDER BY preu_base DESC
		LIMIT 1;
		

--4. Llista les 3 masses més cares ordenades per preu, de la més cara a la més barata.

SELECT * FROM masses
	ORDER BY preu DESC
		LIMIT 3;


--5. Llista quantes comandes ha fet cada client.

SELECT dni_client, COUNT(*) FROM comandes
	GROUP BY dni_client;


--6. Llista totes les comandes realitzades abans del migdia.

SELECT * FROM comandes WHERE HOUR(data) < 12;


--7. Llista els ingredients que contenen al·lergògens, mostrant només el nom de l'ingredient amb l’àlias “Ingredients amb al·lergògens”.

SELECT id_ingredient AS "Ingredients amb al·lergògens" FROM ingredients_alergogens;


--8. Mostra la mitjana de preu per ingredient.

SELECT AVG(preu) FROM ingredients;


--9. Mostra el total de grams d’ingredients que conté cada pizza.

SELECT id_pizza, SUM(grams_per_ingredient) FROM pizzes_ingredients;
	GROUP BY id_pizza;


--10. Llista el nombre total de comandes per client, mostrant el nom del client i el total de comandes realitzades.

SELECT clients.nom, COUNT(comandes.num_comanda) 
	FROM clients
	JOIN comandes
	ON clients.dni = comandes.dni_client
	GROUP BY clients.dni;


--11. Llista les pizzes que tenen més de tres ingredients, mostrant el nom de la pizza i el número d'ingredients.

SELECT pizzes.nom, COUNT(pizzes_ingredients.id_ingredient)
	FROM pizzes JOIN pizzes_ingredients ON pizzes.id = pizzes_ingredients.id_pizza
		GROUP BY pizzes_ingredients
			HAVING COUNT(pizzes_ingredients.id_ingredient) > 3;


--12. Extreu la facturació que ha tingut un client específic en tota la seva vida, indicant la base imposable, l'IVA i el total facturat.

SELECT client.nom, 
	SUM(comandes.preu_total)*0.79 AS "Base imposable",
	SUM(comandes.preu_total)*0.21 AS "IVA",
	SUM(comandes.preu_total) AS "Total facturat",
	FROM clients JOIN comandes
	ON clients.dni = comandes.dni_client
	GROUP BY clients.dni
	HAVING client.dni = "xxxxxxx";