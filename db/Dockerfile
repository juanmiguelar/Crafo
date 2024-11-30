# Usa la imagen específica de PostgreSQL 15.10-alpine
FROM postgres:15.10-alpine

# Copia el archivo de inicialización del esquema
COPY init.sql /docker-entrypoint-initdb.d/init.sql

# Exponer el puerto predeterminado de PostgreSQL
EXPOSE 5432
