# Usamos una imagen ligera de Node.js
FROM node:18-alpine

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos solo los archivos de dependencias para aprovechar la caché de Docker
COPY package*.json ./

# Instalamos las dependencias
RUN npm install

# Copiamos el resto del código
COPY . .

# Exponemos el puerto que usa Astro por defecto
EXPOSE 4321

# Comando para arrancar el modo desarrollo
CMD ["npm", "run", "dev", "--", "--host"]