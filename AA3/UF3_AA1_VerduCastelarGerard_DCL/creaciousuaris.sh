# Comprobació rebuda paràmetres
# Si el recompte de parametres rebuts no es 7, es mostren els següents missatges per pantalla i s'envia el primer missatge fitxer_log
if [ $# != 7 ]; then
    echo "[ERROR] Has escrit $# paràmetres i n'has d'escriure 7 obligatoriament." | tee -a $fitxer_log
    echo "Ús: ./creaciousuaris.sh fitxer_log usuari password host base_de_dades taula privilegis"
    exit 1
fi

# Creació de variables per a guardar els paràmetres rebuts
fitxer_log=$1
usuari=$2
password=$3
host=$4
base_de_dades=$5
taula=$6
privilegis=$7

# Variable per a comprobar si el usuari introduit existeix
usuari_existeix=$(mysql -u root -proot -Bse "SELECT 1 FROM mysql.user WHERE user='$usuari' AND host='$host';")


# Si l'usuari existeix se li assignen els permisos introduits mitjançant la variable atorgacio_permisos
if [ $usuari_existeix ]; then
    echo "[OK] L'usuari ja existeix. Assignant permisos..." | tee -a $fitxer_log
    
    # Accedeix a mysql i garanteix els permisos introduits a la base de dades, la taula i usuari introduits
    # Envia el resultat de la comanda a fitxer_log per a poder comprobar si s'ha executat correctament o registrar els errors que hagin passat
    mysql -u root -proot -Bse "GRANT $privilegis ON $base_de_dades.$taula TO '$usuari'@'$host';" >> $fitxer_log

else
    # Si l'usuari no existeix, es crea l'usuari i despres se li assignen els permisos
    echo "[OK] L'usuari no existeix. Creant usuari i assignant-li permisos..." | tee -a $fitxer_log

    # Accedeix a mysql i crea l'usuari introduit
    # Envia el resultat de la comanda a fitxer_log per a poder comprobar si s'ha executat correctament o registrar els errors que hagin passat

    mysql -u root -proot -Bse "CREATE USER '$usuari'@'$host' IDENTIFIED BY '$password';" >> $fitxer_log

    # Accedeix a mysql i garanteix els permisos introduits a la base de dades, la taula i al usuari introduits
    # Envia el resultat de la comanda a fitxer_log per a poder comprobar si s'ha executat correctament o registrar els errors que hagin passat
    mysql -u root -proot -Bse "GRANT $privilegis ON $base_de_dades.$taula TO '$usuari'@'$host';" >> $fitxer_log

fi

# Mostra els permisos de l'usuari i envia el resultat al fitxer_log
mysql -u root -proot -Bse "SHOW GRANTS FOR '$usuari'@'$host';" >> $fitxer_log

exit 0
