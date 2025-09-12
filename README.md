![CI](https://github.com/NicolFernandaContreras/calculadora-javascript-/actions/workflows/ci.yml/badge.svg)

## Automatización con GitHub Actions

Este repositorio ejecuta un workflow de **CI** en cada push a `main`.
El workflow:
- Configura Node.js 20 e instala dependencias (`npm install`).
- Corre pruebas básicas con **Jest** (`npm test`).
- Verifica que exista `index.html` en la raíz del repo.

### ¿Cómo correr los tests en GitHub?
Solo haz **commit** a `main` y revisa la pestaña **Actions**.

### Evidencias 
- ✅ Captura del workflow en verde (éxito).
<img width="1000" height="300" alt="image" src="https://github.com/user-attachments/assets/2483bdcf-2d04-420d-9d44-2e849f8c3f2a" />
- <img width="1000" height="300" alt="image" src="https://github.com/user-attachments/assets/6bda98e8-a33e-4cc2-b927-634fcf4708bf" />

---

## 🐳 Automatización con Docker

### Pipeline de CI/CD con Docker
El proyecto ahora incluye un **Dockerfile multi-stage** que optimiza tanto el testing como la producción:

**Etapa 1 - Testing:**
- Instala todas las dependencias (incluyendo Jest)
- Ejecuta las pruebas automáticamente
- Falla el build si las pruebas no pasan

**Etapa 2 - Production:**
- Instala solo dependencias de producción
- Configura http-server para servir la aplicación
- Imagen optimizada y liviana

### 🚀 Comandos de Docker

#### Windows (PowerShell):
```powershell
# Ejecutar todo el proceso (pruebas + build)
.\build.ps1

# Solo pruebas
docker build --target testing -t calculadora-test .

# Solo producción
docker build --target production -t calculadora-app .

# Ejecutar aplicación
docker run -p 8080:8080 calculadora-app
```

#### Ubuntu/Linux:
```bash
# Hacer ejecutable el script
chmod +x build.sh

# Ejecutar todo el proceso
./build.sh

# Solo pruebas
docker build --target testing -t calculadora-test .

# Solo producción
docker build --target production -t calculadora-app .

# Ejecutar aplicación
docker run -p 8080:8080 calculadora-app
```

### 🐳 Despliegue Local con Docker

#### Opción 1: Proceso Completo (Recomendado)
```bash
# Clonar el repositorio
git clone https://github.com/NicolFernandaContreras/calculadora-javascript-.git
cd calculadora-javascript-

# Windows
.\build.ps1

# Linux/Mac
chmod +x build.sh && ./build.sh

# Acceder a la aplicación en http://localhost:8080
```

#### Opción 2: Comandos Manuales
```bash
# Solo pruebas
docker build --target testing -t calculadora-test .

# Imagen de producción (después de que pasen las pruebas)
docker build --target production -t calculadora-app .

# Ejecutar aplicación
docker run -p 8080:8080 calculadora-app
```

---
# 📟 Calculadora Web - Despliegue en AWS EC2

Esta es una aplicación web de calculadora realizada en JavaScript, HTML y CSS puro. El objetivo de este proyecto fue desplegar exitosamente la aplicación en una instancia EC2 de AWS usando un servidor HTTP simple.

## 📌 Descripción de la Aplicación

La aplicación permite realizar operaciones matemáticas básicas (suma, resta, multiplicación, división) desde una interfaz visual amigable. Ideal para demostrar la ejecución de aplicaciones estáticas en entornos de nube.

## 🛠️ Tecnologías Utilizadas

- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)  
- **Backend**: Node.js (v22, mediante NVM)  
- **Servidor**: [http-server](https://www.npmjs.com/package/http-server)  
- **Testing**: Jest con jsdom  
- **Containerización**: Docker (Multi-stage builds)  
- **CI/CD**: GitHub Actions  
- **Cloud**: AWS EC2 (Ubuntu Server 22.04 LTS)  
- **Automatización**: PowerShell y Bash scripts

## 🌐 URLs de la Aplicación

**Producción (AWS EC2):**
```
http://18.219.35.217:8080
```

**Local (Docker):**
```
http://localhost:8080
```


---

## 📋 Requisitos Previos

### Para Despliegue con Docker (Recomendado):
- Docker Desktop instalado
- Git para clonar el repositorio
- PowerShell (Windows) o Bash (Linux/Mac)

### Para Despliegue en AWS EC2:
- Cuenta en AWS con acceso al Free Tier  
- Instancia EC2 corriendo (Ubuntu)  
- Configuración del Security Group con puertos:  
  - 22 (SSH)  
  - 8080 (HTTP-server)  
- Aplicación web (repositorio GitHub)  
- Conocimientos básicos de terminal

### Para Desarrollo Local (sin Docker):
- Node.js v22+ (recomendado usar NVM)
- npm para instalar dependencias
- Editor de código (VS Code recomendado)

---

## 🚀 Paso a Paso del Despliegue

### 1️⃣ Conexión a la Instancia EC2

Desde la consola de AWS:

- Ve a **EC2 > Instances**
- Selecciona tu instancia
- Clic en **Connect**
- Usa **EC2 Instance Connect** o terminal con SSH:

---

### 2️⃣ Instalación y Configuración del Entorno

Actualiza el sistema operativo:

```bash
sudo apt update
sudo apt upgrade -y
```

Instala NVM (Node Version Manager):

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

Activa NVM:

```bash
. "$HOME/.nvm/nvm.sh"
```

Instala Node.js v22:

```bash
nvm install 22
```

Verifica versión de Node:

```bash
node -v
```

---

### 3️⃣ Clonar el Repositorio de la Calculadora

```bash
git clone https://github.com/NicolFernandaContreras/calculadora-javascript-.git
cd calculadora-javascript-/
```

---

### 4️⃣ Instalar el Servidor HTTP y Ejecutar

Instala el servidor `http-server` de forma global:

```bash
npm install -g http-server
```

Ejecuta la aplicación en el puerto 8080:

```bash
http-server -p 8080
```

---

### 🌐 Acceder a la Aplicación

Desde tu navegador visita:

```
http://18.219.35.217:8080
```

> Asegúrate de que tu Security Group tenga abierto el puerto 8080.

---

## 🔐 Configuración del Security Group

| Tipo              | Puerto | Origen    | Descripción                |
|-------------------|--------|-----------|----------------------------|
| SSH               | 22     | 0.0.0.0/0 | Acceso remoto (cuidado)    |
| TCP Personalizado | 8080   | 0.0.0.0/0 | Acceso a la aplicación web |

---

## ❌ Problemas Encontrados

- El navegador no accedía a la aplicación: se resolvió abriendo el puerto 8080 en el Security Group.  
- Node.js no estaba disponible al inicio: se solucionó usando NVM para instalar la versión adecuada.

---

## 💡 Lecciones y Buenas Prácticas

- Siempre validar los puertos habilitados en los Security Groups.  
- NVM facilita la instalación de versiones específicas de Node.js sin conflictos.  
- Usar `http-server` es ideal para probar apps estáticas sin necesidad de frameworks adicionales.  
- Monitorear el uso de la instancia para evitar costos fuera del Free Tier.  
- Mantener claves y datos sensibles fuera del repositorio.

---

## 📁 Estructura del Proyecto

```
calculadora-javascript-/
├── 📁 .github/
│   └── 📁 workflows/
│       └── ci.yml              # GitHub Actions CI/CD
├── 📁 tests/
│   └── basic.test.js           # Pruebas con Jest
├── 📄 README.md                # Documentación
├── 📄 index.html               # Aplicación principal
├── 📄 index.css                # Estilos CSS
├── 📄 index.js                 # Lógica JavaScript
├── 📄 Calculadora.js           # Módulo calculadora
├── 📄 Display.js               # Módulo display
├── 📄 package.json             # Dependencias Node.js
├── 🐳 Dockerfile               # Multi-stage para Docker
├── 📄 .dockerignore            # Archivos excluidos del build
├── 🔧 build.ps1                # Script de build (Windows)
└── 🔧 build.sh                 # Script de build (Linux/Mac)
```
