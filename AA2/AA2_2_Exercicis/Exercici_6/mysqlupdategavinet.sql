--a)
INSERT INTO  client (dni_client, nom_client, adreça_client) 
    VALUES('000000007', 'Manolito', 'Nicaragua 50');


INSERT INTO assumpte (id_assumpte, periode, estat, id_client) 
    VALUES('25-26', TRUE, (SELECT id_client FROM client WHERE id_client=6));

INSERT INTO assumpte (periode, estat, id_client) 
    VALUES('25-26', TRUE, (SELECT id_client FROM client WHERE id_client=6));

INSERT INTO assumpte (periode, estat, id_client) 
    VALUES('25-26', TRUE, (SELECT id_client FROM client WHERE id_client=6));



INSERT INTO  client (dni_client, nom_client, adreça_client) 
    VALUES('000000008', 'Manoliti', 'Nicaragua 51');

INSERT INTO assumpte (id_assumpte, periode, estat, id_client) 
    VALUES('25-26', TRUE, (SELECT id_client FROM client WHERE id_client=7));

INSERT INTO assumpte (periode, estat, id_client) 
    VALUES('25-26', TRUE, (SELECT id_client FROM client WHERE id_client=7));

INSERT INTO assumpte (periode, estat, id_client) 
    VALUES('25-26', TRUE, (SELECT id_client FROM client WHERE id_client=7));



INSERT INTO  client (dni_client, nom_client, adreça_client) 
    VALUES('000000009', 'Manolita', 'Nicaragua 52');

INSERT INTO assumpte (id_assumpte, periode, estat, id_client) 
    VALUES('25-26', TRUE, (SELECT id_client FROM client WHERE id_client=8));

INSERT INTO assumpte (periode, estat, id_client) 
    VALUES('25-26', TRUE, (SELECT id_client FROM client WHERE id_client=8));

INSERT INTO assumpte (periode, estat, id_client) 
    VALUES('25-26', TRUE, (SELECT id_client FROM client WHERE id_client=8));



SELECT * FROM client;




--b)
INSERT INTO portacio
    VALUES(
        (SELECT id_procurador FROM procurador WHERE id_procurador=1), 
        (SELECT id_assumpte FROM assumpte WHERE id_assumpte=2));

INSERT INTO portacio
    VALUES(
        (SELECT id_procurador FROM procurador WHERE id_procurador=2), 
        (SELECT id_assumpte FROM assumpte WHERE id_assumpte=3));

INSERT INTO portacio
    VALUES(
        (SELECT id_procurador FROM procurador WHERE id_procurador=3), 
        (SELECT id_assumpte FROM assumpte WHERE id_assumpte=4));




--c) Per a esborrar tota la informacio d'un client al esborrar un client s'hauria d'executar el següent:
ALTER TABLE assumpte
    DROP CONSTRAINT fk_client;

ALTER TABLE assumpte
    ADD CONSTRAINT fk_client FOREIGN KEY (id_client) REFERENCES client(id_client)
        ON DELETE CASCADE;



ALTER TABLE portacio
    DROP CONSTRAINT fk_procurador;

ALTER TABLE portacio
	ADD CONSTRAINT fk_procurador FOREIGN KEY (id_procurador) REFERENCES procurador(id_procurador)
        ON DELETE CASCADE;

ALTER TABLE portacio
    DROP CONSTRAINT fk_assumpte;

ALTER TABLE portacio
   	ADD CONSTRAINT fk_assumpte FOREIGN KEY (id_assumpte) REFERENCES assumpte(id_assumpte)
        ON DELETE CASCADE;



DELETE FROM client WHERE id_client=2;



SELECT * FROM client;
SELECT * FROM assumpte;
SELECT * FROM portacio;