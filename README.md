# nextjs-multistage-dockerfile

## Integrantes:

- Casais, Francisco
- Sampieri, Juan Francisco

## Resumen

Estos son los archivos necesarios para hostear una aplicación Next.js en un servidor Nginx. Este se ubicará dentro de un contenedor Docker creado a partir de un Multistage Dockerfile que primero copia los archivos locales de la aplicación e instala las dependecias, y luego copia los archivos necesarios para configurar el servidor en una imagen aparte.

- ```casais-sampieri```: Archivos locales de la aplicación Next.js
- ```default.conf```: Archivo de configuración del servidor Nginx
- ```docker-compose.yaml```: Archivo que construirá el contenedor Docker con el servidor Nginx y la página estática hosteada dentro del mismo
- ```dockerfile```: Archivo que construye la imagen del contenedor Docker anterior mencionado

## Construcción y ejecución del proyecto:

1. Clonar el repositorio en tu terminal con:

    ```
    git clone https://github.com/FranciscoCasais/nextjs-multistage-dockerfile.git
    ```

2. Ingresar al directorio donde se clonó y ejecutar el archivo ```docker-compose.yaml``` con el siguiente comando:

    ```
    docker-compose -f ./docker-compose.yaml up -d
    ```

3. El servidor se ejecuta por defecto en el puerto 3000. Podés ir a tu navegador para acceder a él y deberías ver la página por defecto de Next.js. Para cambiar el puerto editar el ```docker-compose.yaml```.
4. Para finalizar la ejecución y eliminar el contenedor e imagen:

    ```
    // Detener el contenedor de Nginx
    docker stop casais-sampieri

    // En caso de querer volver a ejecutarlo
    docker start casais-sampieri

    // Eliminar el contenedor y su imagen
    docker rm casais-sampieri
    docker image rm nextjs-multistage-dockerfile_web

    // Verifiar contenedor e imágenes descargadas
    docker ps -a
    docker images
