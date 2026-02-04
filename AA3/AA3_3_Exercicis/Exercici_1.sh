# Mostra les bases de dades i guarda el resultat al .txt (-e s'utilitza per a executar)
mysql -u root -pAlumne.123 -e "SHOW DATABASES" > resultat.txt

# Comprovem si rebem els paràmetres
if [$# != 5]; then
    echo "[Error] Has escrit $# parametres"
    echo "Ús: ./backupBD.sh usuari password host base_de_dades desti"
    exit 1
fi

usuari=$1
contrasenya=$2
host=$3
base_de_dades=$3
desti=$5

# Preparem les variables rebudes per paràmetre
if [! -d $desti]; then
    echo "[ERROR] La ruta $desti no existeix"
    exit 1
fi


# Fem copia de seguretat amb mysqldump
copia_seguretat="$base_de_dades".sql
mysqldump -u root -pAlumne.123 "$base_de_dades" > escolaBU.sql

# Comprimim la còpia de seguretat amb gzip
gzip "$copia_seguretat"

# Movem la còpia de seguretat comprimida al directori de destí amb mv
copia_seguretat_comprimida="$copia_seguretat".gzip
mv "$copia_seguretat_comprimida" "$desti"

exit 0