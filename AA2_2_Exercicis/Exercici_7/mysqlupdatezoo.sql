--a)
UPDATE zoo SET pressupost=(pressupost*1.1)
    WHERE zoo.id_zoo IN (
        SELECT animal.id_zoo FROM animal 
            WHERE animal.sexe='Femeni'
            AND animal.continent='Àfrica');

SELECT * FROM zoo;




--b) Els animals associats nomes s'esborrarien si abans s'executa el següent:
ALTER TABLE animal
    DROP CONSTRAINT fk_zoo;

ALTER TABLE animal
    ADD CONSTRAINT fk_zoo FOREIGN KEY (id_zoo) REFERENCES zoo(id_zoo)
        ON DELETE CASCADE;

DELETE FROM zoo WHERE zoo='Zoològic de Barcelona';

SELECT * FROM animal;




--c) Els animals associats nomes s'esborrarien si abans s'executa el següent:
ALTER TABLE animal
    DROP CONSTRAINT fk_especie;

ALTER TABLE animal
	ADD CONSTRAINT fk_especie FOREIGN KEY (id_especie) REFERENCES especie(id_especie)
        ON DELETE CASCADE;

DELETE FROM especie WHERE especie='Tigre';

SELECT * FROM animal;