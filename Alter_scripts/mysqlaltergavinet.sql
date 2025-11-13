RENAME TABLE procurador TO advocat;

SHOW TABLES;

ALTER TABLE assumpte
	DROP CONSTRAINT fk_client;

DESCRIBE TABLE assumpte;

ALTER TABLE assumpte
	ADD CONSTRAINT fk_client FOREIGN KEY (id_client) REFERENCES client(id_client);

DESCRIBE TABLE assumpte;
