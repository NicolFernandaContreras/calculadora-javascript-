# Etapa 1: Testing
FROM node:22-alpine AS testing

WORKDIR /app

# Copiar package.json y instalar dependencias
COPY package*.json ./
RUN npm install

# Copiar el código fuente
COPY . .

# Ejecutar las pruebas
RUN npm test

# Etapa 2: Production
FROM node:22-alpine AS production

WORKDIR /app

# Copiar package.json 
COPY package*.json ./

# Instalar http-server y dependencias de producción
RUN npm install -g http-server
RUN npm install --only=production

# Copiar el resto del código de la aplicación
COPY . .

# Exponer el puerto
EXPOSE 8080

# Comando para iniciar la aplicación
CMD ["http-server", "-p", "8080"]