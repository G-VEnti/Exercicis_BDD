--a) Utilitzo el COUNT(*) per a contar la quantitat de registres que hi han a la taula regions
SELECT COUNT(*) FROM regions;


--b) De la taula localitats faig que em mostri els registres on el nom comenci per B
SELECT nom FROM localitats WHERE nom LIKE 'B%';


--c) Utilitzo MAX() per a mostrar el registre amb el numero mes alt entre tots
SELECT MAX(salari) FROM empleats;


--d) Mostra el nom i telefon de la taula empleats on el salari sigui superior a 20000
SELECT nom, telefon FROM empleats
    WHERE salari<20000;


--e) Amb una subconsulta busco els registres que tinguin el nom Pamplon a la taula localitats utilitzant la FOREIGN KEY codi_l
SELECT nom, salari FROM empleats
    WHERE codi_l IN (SELECT codi_l FROM localitats WHERE nom='Pamplon');


--f)
SELECT AVG(salari) FROM empleats
    WHERE codi_l IN (SELECT codi_l FROM localitats WHERE nom='Barcelona');


--g)
SELECT nom FROM provincies WHERE nom_regio='Comunitat Valenciana';


--h)
INSERT INTO localitats VALUES(1234, 'Manresa', '0000');

INSERT INTO empleats (id_e, nom) VALUES(00006, 'Hermenegild');

SELECT localitats.codi_l, localitats.nom FROM localitats
    LEFT JOIN empleats ON localitats.codi_l=empleats.codi_l
        WHERE empleats.codi_l IS NULL;


--i)
SELECT regions.nom_regio, provincies.codi_p FROM regions
    JOIN provincies ON regions.nom_regio=provincies.nom_regio
        WHERE regions.nom_regio IN (
            SELECT nom_regio FROM provincies
                GROUP BY nom_regio HAVING COUNT(*) > 1);


--j)
SELECT COUNT(*) AS 'Quantitat empleats', localitats.nom AS 'localitat' FROM empleats
    JOIN localitats ON empleats.codi_l=localitats.codi_l
        GROUP BY localitats.nom;


--k)
SELECT empleats.nom FROM empleats
    JOIN localitats ON empleats.codi_l=localitats.codi_l
        JOIN provincies ON localitats.codi_p=provincies.codi_p
            JOIN regions ON provincies.nom_regio=regions.nom_regio
                WHERE regions.nom_regio='Comunitat Valenciana';


--l)
SELECT regions.nom_regio FROM regions
    WHERE regions.nom_regio NOT IN
    (
        SELECT provincies.nom_regio FROM provincies
            JOIN localitats ON provincies.codi_p=localitats.codi_p
                JOIN empleats ON localitats.codi_l=empleats.codi_l
    );