CREATE DATABASE hollowHabilities;
\c hollowHabilities;

CREATE TYPE tipus_habilitat AS ENUM('MOVIMENT', 'ATAC', 'VIDA');

CREATE TYPE info_habilitat AS (
    tipus_habilitat tipus_habilitat,
    zona_desbloqueig VARCHAR(20),
    desbloquejada BOOL,
    temps_utilitzada_M INT,
    ordre_desbloqueig INT,
);

CREATE TABLE jugadors (
    id SERIAL,
    nom VARCHAR(20),
    data_jugacio DATE,
    temps_jugacio_H DECIMAL,
    PRIMARY KEY (id)
);

CREATE TABLE habilitats (
    id SERIAL,
    nom VARCHAR(20),
    info info_habilitat,
    jugador INT,
    PRIMARY KEY (id),
    FOREIGN KEY (jugador) REFERENCES jugadors(id)
);

INSERT INTO jugadors (nom, data_jugacio, temps_jugacio_H) VALUES
    ('Luffy', '2023-01-20', 8.5),
    ('Zoro', '2024-06-15', 36.2),
    ('Sanji', '2023-10-23', 6.3);

INSERT INTO habilitats (nom, info, jugador) VALUES
    ('Focus', ROW('VIDA', 'Default ability', TRUE, 226, 0), 1),
    ('Focus', ROW('VIDA', 'Default ability', TRUE, 400, 0), 2),
    ('Focus', ROW('VIDA', 'Default ability', TRUE, 150, 0), 3),
    ('Vengeful Spirit', ROW('ATAC', 'Ancestral Mound', TRUE, 125, 1), 1),
    ('Vengeful Spirit', ROW('ATAC', 'Ancestral Mound', TRUE, 250, 1), 2),
    ('Vengeful Spirit', ROW('ATAC', 'Ancestral Mound', TRUE, 80, 1), 3),
    ('Desolate Dive', ROW('ATAC', 'Soul Sanctum', TRUE, 70, 4), 1),
    ('Desolate Dive', ROW('ATAC', 'Soul Sanctum', TRUE, 365, 4), 2),
    ('Desolate Dive', ROW('ATAC', 'Soul Sanctum', TRUE, 131, 4), 3),
    ('Howling Wraiths', ROW('ATAC', 'Overgrown Mound', TRUE, 226, 6), 2),
    ('Shade Soul', ROW('ATAC', 'Soul Sanctum', TRUE, 226, 10), 2),
    ('Descending Dark', ROW('ATAC', 'Crystallised Mound', TRUE, 226, 11), 2),
    ('Abyss Shriek', ROW('VIDA', 'The Abyss', TRUE, 226, 12), 2),
    ('Mothwing Cloak', ROW('MOVIMENT', 'Greenpath', TRUE, 226, 2), 2),
    ('Mantis Claw', ROW('MOVIMENT', 'Mantis Village', TRUE, 226, 3), 2),
    ('Crystal Heart', ROW('MOVIMENT', 'Crystal Peaks', TRUE, 226, 5), 2),
    ('Monarch Wings', ROW('MOVIMENT', 'Ancient Basin', TRUE, 226, 7), 2),
    ('Isma Tear', ROW('MOVIMENT', 'Isma Grove', TRUE, 226, 9), 2),
    ('Shade Cloak', ROW('MOVIMENT', 'The Abyss', TRUE, 226, 8), 2);