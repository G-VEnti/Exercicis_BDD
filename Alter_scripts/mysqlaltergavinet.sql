RENAME TABLE procurador TO advocat;

DESCRIBE advocat;

ALTER TABLE assumpte
	DROP CONSTRAINT fk_client;

ALTER TABLE assumpte
	ADD CONSTRAINT fk_client FOREIGN KEY (id_client) REFERENCES client(id_client);
