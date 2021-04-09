# Dump and restore database

Ejemplos de script para hacer dumps y restores de tablas y base datos desde consola.

## Pasos previos

- Damos permisos de ejecucion a los scripts `chmod +x dumpdb.sh`
- Configuramos los datos de conexión en el fichero config.sh

## Uso

- Para hacer dump ejecutamos el script

```sh
# Desde un directorio
/ruta/al/archivo.sh

# Desde el mismo directorio
./archivo.sh
```

- Para hacer restore ejecutamos el script

```sh

# Desde un directorio
/ruta/al/archivo.sh < /dev/tty

# Desde el mismo directorio
./archivo.sh < /dev/tty

```

