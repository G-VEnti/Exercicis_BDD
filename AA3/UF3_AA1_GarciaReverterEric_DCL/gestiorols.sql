-- 8
CREATE ROLE 'xenomorf';

GRANT ALL ON galaxia.planetes TO 'xenomorf';
GRANT ALL ON galaxia.tripulants TO 'xenomorf';

CREATE ROLE 'metahuma';

GRANT ALL ON galaxia.naus TO 'metahuma';

SELECT * FROM mysql.user;

SHOW GRANTS FOR 'xenomorf';

SHOW GRANTS FOR 'metahuma';

-- 9
SET DEFAULT ROLE 'metahuma' TO 'clark'@127.0.0.1;

-- Conectat desde clark
SELECT CURRENT_ROLE();