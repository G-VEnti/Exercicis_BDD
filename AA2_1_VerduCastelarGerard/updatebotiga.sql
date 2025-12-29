UPDATE productes
    SET estoc=(estoc + 50)
        WHERE estoc<5;

DELETE FROM clients
    WHERE id NOT IN (SELECT id_client FROM comandes);