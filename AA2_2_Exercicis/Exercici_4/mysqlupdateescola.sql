INSERT INTO professor (id_p, nom) VALUES ('12345', 'Joel Miller');

SELECT * FROM professor;


INSERT INTO assignatura VALUES ('1231231231', 'Supervivencia', '12345');
INSERT INTO assignatura VALUES ('4564564564', 'Armament', '45678');

SELECT * FROM assignatura;


INSERT INTO alumne (num_matricula, nom) VALUES ('7777RRR', 'Ellie Williams');

SELECT * FROM alumne;


INSERT INTO matriculacio (num_matricula_alumne, codi_assignatura) VALUES ('7777RRR', '1231231231');
INSERT INTO matriculacio (num_matricula_alumne, codi_assignatura) VALUES ('7777RRR', '4564564564');

SELECT * FROM matriculacio;
SET autocommit=0;


