# Usamos la imagen base oficial de PostgreSQL 15 en Alpine
FROM postgres:15-alpine

# Seteamos las variables de entorno para el usuario y la contraseña de PostgreSQL
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

# Copiamos los archivos de healthchecks (verifica que el archivo `postgres.sh` exista en tu directorio local)
COPY ./healthchecks /healthchecks

# Cambiamos los permisos del archivo de healthcheck si es necesario
RUN chmod +x /healthchecks/postgres.sh

# Configuramos el volumen para almacenar los datos de la base de datos
VOLUME ["/var/lib/postgresql/data"]

# Definimos el healthcheck utilizando el script de salud
HEALTHCHECK --interval=5s CMD /healthchecks/postgres.sh || exit 1

# Especificamos el puerto por defecto de PostgreSQL
EXPOSE 5432