SELECT COUNT(*) AS 'Nombre total alumnes' FROM alumne;


SELECT COUNT(*) FROM matriculacio
	WHERE any_academic IN ('20212022','20222023');


SELECT id_p FROM professor WHERE nif_p LIKE '4%';


SELECT nom, telefon FROM professor
	WHERE telefon LIKE '%9';


SELECT num_matricula, nom, telefon FROM alumne
	WHERE YEAR(data_naixement) BETWEEN 1995 AND 2005;


SELECT nom, telefon FROM professor
	WHERE id_p IN (
		SELECT * id_p_professor FROM assignatura
	);


SELECT assignatura.nom, matriculacio.any_academic FROM matriculacio 
	INNER JOIN assignatura
	ON matriculacio.codi_assignatura=assignatura.codi;


SELECT assignatura.nom, COUNT(*) FROM assignatura
	JOIN matriculacio
	ON assignatura.codi=matriculacio.codi_assignatura
	GROUP BY matriculacio.codi_assignatura;

--Millores sintactiques:
/*SELECT assignatura.nom, COUNT(*) AS 'Quantitat alumnes matriculats'
	FROM assignatura AS a
	JOIN matriculacio AS m
	ON a.codi = m.codi_assignatura
	GROUP BY m.codi_assignatura;*/
