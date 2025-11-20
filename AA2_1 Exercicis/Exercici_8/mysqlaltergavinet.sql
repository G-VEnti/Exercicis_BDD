RENAME TABLE procurador TO advocat;

SHOW TABLES;

ALTER TABLE assumpte
	DROP CONSTRAINT fk_client;

DESCRIBE TABLE assumpte;

ALTER TABLE assumpte
	ADD CONSTRAINT fk_client FOREIGN KEY (id_client) REFERENCES client(id_client) ON DELETE CASCADE;

DESCRIBE TABLE assumpte;

ALTER TABLE portacio
	DROP CONSTRAINT fk_assumpte;

DESCRIBE TABLE portacio;

ALTER TABLE portacio
	ADD CONSTRAINT fk_assumpte FOREIGN KEY (id_assumpte) REFERENCES assumpte(id_assumpte)  ON DELETE CASCADE;


DESCRIBE TABLE portacio;
