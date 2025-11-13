RENAME TABLE
	procurador TO advocat;

DESCRIBE advocat;

ALTER TABLE assumpte
	DROP FOREIGN KEY (id_client);


ALTER TABLE assumpte
	ADD id_client INT AFTER estat,
	ADD FOREIGN KEY (id_client) REFERENCES client(id_client) ON DELETE CASCADE;
