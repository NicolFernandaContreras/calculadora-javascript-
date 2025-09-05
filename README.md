![CI](https://github.com/NicolFernandaContreras/calculadora-javascript-/actions/workflows/ci.yml/badge.svg)

## Automatización con GitHub Actions

Este repositorio ejecuta un workflow de **CI** en cada push a `main`.
El workflow:
- Configura Node.js 20 e instala dependencias (`npm install`).
- Corre pruebas básicas con **Jest** (`npm test`).
- Verifica que exista `index.html` en la raíz del repo.

### ¿Cómo correr los tests en GitHub?
Solo haz **commit** a `main` y revisa la pestaña **Actions**.

### Notificaciones
En el repo, haz clic en **Watch → All Activity** para recibir notificaciones por email cuando el workflow pase o falle.

### Evidencias sugeridas
- ✅ Captura del workflow en verde (éxito).
- ❌ Captura de un fallo a propósito (ej. cambiando un `expect` del test para que falle). Luego vuelve a dejarlo bien.

# 📟 Calculadora Web - Despliegue en AWS EC2

Esta es una aplicación web de calculadora realizada en JavaScript, HTML y CSS puro. El objetivo de este proyecto fue desplegar exitosamente la aplicación en una instancia EC2 de AWS usando un servidor HTTP simple.

## 📌 Descripción de la Aplicación

La aplicación permite realizar operaciones matemáticas básicas (suma, resta, multiplicación, división) desde una interfaz visual amigable. Ideal para demostrar la ejecución de aplicaciones estáticas en entornos de nube.

## 🛠️ Tecnologías Utilizadas

- HTML5  
- CSS3  
- JavaScript (Vanilla)  
- Node.js (v22, mediante NVM)  
- Servidor estático: [http-server](https://www.npmjs.com/package/http-server)  
- AWS EC2 (Ubuntu Server 22.04 LTS)

## 🌐 URL de la Aplicación

```
http://18.219.35.217:8080
```


---

## 📋 Requisitos Previos

- Cuenta en AWS con acceso al Free Tier  
- Instancia EC2 corriendo (Ubuntu)  
- Configuración del Security Group con puertos:  
  - 22 (SSH)  
  - 8080 (HTTP-server)  
- Aplicación web (repositorio GitHub)  
- Conocimientos básicos de terminal

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
mi-proyecto-aws/
├── README.md
├── index.html
├── style.css
└── script.js
```
