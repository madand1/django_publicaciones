FROM python:3.9

WORKDIR /app

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    netcat-openbsd

# Copiar los archivos del proyecto
COPY . /app/

# Instalar dependencias de Python
RUN pip install -r requirements.txt
RUN pip install mysqlclient

# Copiar y hacer ejecutable el script de entrada
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Exponer el puerto 8000
EXPOSE 8000

# Usar el script de entrada como comando
CMD ["/app/entrypoint.sh"]
