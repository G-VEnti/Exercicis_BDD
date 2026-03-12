#pragma once

#include <pqxx/pqxx>
#include <iostream>
#include "orm.hpp"

// Opció (1) del menú: crear una nova habilitat
void opcioCreate(pqxx::connection &conn);

// Opció (2) del menú: consultar les habilitats existents
void opcioRead(pqxx::connection &conn);

// Opció (3) del menú: actualitzar una habilitat existent
void opcioUpdate(pqxx::connection &conn);

// Opció (4) del menú: esborrar una habilitat existent
void opcioDelete(pqxx::connection &conn);