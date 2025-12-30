ALTER TABLE proveidors
    ADD CHECK (correu LIKE '%@%.%');


ALTER TABLE descomptes
    ADD CHECK (data_final>data_inici);


ALTER TABLE categories
    ADD COLUMN descripcio VARCHAR(50)
        DEFAULT 'Nova categoria';


ALTER TABLE valoracions
    DROP CONSTRAINT fk_id_client_v;

ALTER TABLE valoracions
    ADD CONSTRAINT fk_id_client_v
        FOREIGN KEY (id_client) REFERENCES clients(id)
            ON DELETE CASCADE;



SHOW CREATE TABLE proveidors;
SHOW CREATE TABLE descomptes;
DESCRIBE categories;
SHOW CREATE TABLE valoracions;
