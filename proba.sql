CREATE TABLE games
(
    id_game INT AUTO_INCREMENT,
    name VARCHAR(20),
    price FLOAT,
    PRIMARY KEY (id_game)
);

INSERT INTO games (name, price) 
    VALUES
    ('Hollow Knight', 19.99),
    ('Spiderman', 59.99),
    ('Cyberpunk 2077', 60),
    ('Climbound', 4.99);


SELECT name FROM games ORDER BY price DESC LIMIT 2;