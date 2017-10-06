# Configuraciones básicas y creación de dockers de prueba

## Primer paso
Debes construir un docker personalizado que incluye el servidor openssh

    docker build -t server:16.04 .

En el paso anterior debes verificar el ID de la imágen que se creó y seleccionarla para los pasos a continuación.

## Segundo paso, despliege

Ahora debes crear un conjunto de maquinas para pruebas, se crearán automáticamente un servidor `nginx`, uno de bases de datos en `mysql` y un servidor noSQL en `redis`.

    0.0.0.0:6379->6379/tcp, 0.0.0.0:2223->22/tcp   server03
    0.0.0.0:3306->3306/tcp, 0.0.0.0:2222->22/tcp   server02
    0.0.0.0:2221->22/tcp, 0.0.0.0:8000->80/tcp     server01

Si lo deseas puedes modificar el archivo `create_dockers.sh` ajustando los parametros que consideres necesarios para lanzar los dockers que se ajusten al experimento que diseñes.

    ../create_dockers.sh server:16.04

## Tercer paso, configuración de alias
Opción 1: edita el archivo `/etc/hosts` y adiciona 3 alias a localhost

    127.0.0.1       server01 server02 server03

Opción 2: adición automática en el archivo de hosts del sistema

    echo "127.0.0.1 server01 server02 server03" | sudo tee -a /etc/hosts

## Cuarto paso, confirmación
Realiza una prueba de conexión a las maquinas que se crearon recientemente, por defecto el paso anterior crea n cantidad de dockers con el `puerto 2221, 2222 y 2223` abiertos para conexión:

    ssh root@server01 -p 2221 -i ../key.private
    ssh root@server02 -p 2222 -i ../key.private
    ssh root@server03 -p 2223 -i ../key.private

Si la conexión se establece, ya está listo el banco de pruebas y puedes ingresar a ansible001.
