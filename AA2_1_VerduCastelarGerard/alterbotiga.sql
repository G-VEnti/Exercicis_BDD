--a)
ALTER TABLE proveidors
    ADD CHECK (correu LIKE '%@%.%');


--b)
ALTER TABLE descomptes
    ADD CHECK (data_final>data_inici);


--c)
ALTER TABLE categories
    ADD COLUMN descripcio VARCHAR(50)
        DEFAULT 'Nova categoria';


--d)
ALTER TABLE valoracions
    DROP CONSTRAINT fk_id_client;

ALTER TABLE valoracions
    ADD CONSTRAINT fk_id_client
        FOREIGN KEY (id_client) REFERENCES clients(id)
            ON DELETE CASCADE;