-- 4
CREATE USER alien@'localhost';

SHOW GRANTS FOR 'alien'@'localhost'

-- 5
CREATE USER clark@127.0.0.1 IDENTIFIED BY 'kent';

SHOW GRANTS FOR 'clark'@127.0.0.1;

-- 6
GRANT SELECT, INSERT, UPDATE, GRANT OPTION ON galaxia.* TO alien@'localhost';

SHOW GRANTS FOR 'alien'@'localhost';

-- 7 Conectat desde alien
GRANT SELECT ON galaxia.naus TO clark@127.0.0.1;

-- Conectat desde root
SHOW GRANTS FOR clark@127.0.0.1;