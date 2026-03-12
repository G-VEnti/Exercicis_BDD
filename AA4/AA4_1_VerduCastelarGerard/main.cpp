#include <iostream>
#include <string>
#include <pqxx/pqxx>
#include "opcions_menu.hpp"

int main(int argc, char *argv[])
{
    try
    {
        pqxx::connection conn("dbname = hollowHabilities user = postgres password = Alumne.123");
        if (conn.is_open())
        {
            std::cout << "S'ha obert la base de dades: " << conn.dbname() << std::endl;

            conn.prepare("insert", "INSERT INTO habilitats (nom, info, jugador) VALUES ($1, ROW($2, $3, $4, $5, $5), $6)");
            conn.prepare("select", "SELECT id, (info).*, jugador FROM habilitats");
            conn.prepare("update", "UPDATE habilitats SET habilitat = ROW($2, $3, $4, $5, $5) WHERE id = $1");

            int opcio_menu = 0;

            do
            {
                std::cout << "\n <<< Habilitats desbloquejades per jugador a HK >>>" << std::endl;
                std::cout << "\n Indica quina opció vols fer: " << std::endl;
                std::cout << "\t (1) Inserir una habilitat" << std::endl;
                std::cout << "\t (2) Consultar una habilitat" << std::endl;
                std::cout << "\t (3) Actualtitzar una habilitat" << std::endl;
                std::cout << "\t (4) Esborrar una habilitat" << std::endl;
                std::cout << "\t (5) Sortir" << std::endl;
                std::cin >> opcio_menu;

                switch (opcio_menu)
                {
                case 1:
                    opcioCreate(conn);
                    break;
                case 2:
                    opcioRead(conn);
                    break;
                case 3:
                    opcioUpdate(conn);
                    break;
                case 4:
                    opcioDelete(conn);
                    break;
                case 5:
                    // TODO sortida del programa
                    break;
                default:
                    std::cout << "La opció " << opcio_menu << " no existeix." << std::endl;
                    break;
                }

            } while (opcio_menu != 5);
            
        }
        else
        {
            std::cout << "No s'ha pogut obrir la base de dades." << std::endl;
            return 1;
        }        
    }
    catch (const std::exception &e)
    {
        std::cerr << e.what() << std::endl;
        return 1;
    }    
}