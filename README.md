Guía de Despliegue — Calculadora JS en AWS (EC2)

☀️ Proyecto: Calculadora JavaScript (estática)
📦 Repo: github.com/NicolFernandaContreras/calculadora-javascript-.git
🌐 Servida con: http-server en el puerto 8080

Esta guía lanza un servidor HTTP simple para archivos estáticos (HTML/CSS/JS) en una instancia Ubuntu de EC2.

📋 Requisitos Previos

Instancia EC2 (Ubuntu) creada y corriendo.

Security Group con puertos 22 (SSH) y 8080 (HTTP del http-server) abiertos.

🚀 Paso 1: Conectarte a tu Instancia

Opción A: EC2 Instance Connect (recomendado)

AWS Console → EC2 → Instances

Selecciona tu instancia → Connect → EC2 Instance Connect → Connect

🔧 Paso 2: Preparar el Entorno (Ubuntu)

Ejecuta, en orden:
# 1) Actualiza paquetes
sudo apt update

# 2) Aplica actualizaciones
sudo apt upgrade -y

# 3) Instala NVM (gestor de Node)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# 4) Carga NVM en la sesión actual
. "$HOME/.nvm/nvm.sh"

# 5) Instala Node.js (v22)
nvm install 22

# 6) Verifica versión de Node
node -v

📥 Paso 3: Clonar tu Repositorio
git clone https://github.com/NicolFernandaContreras/calculadora-javascript-.git
cd calculadora-javascript-/

🌐 Paso 4: Levantar el servidor estático
# 9) Instala http-server de forma global
npm install -g http-server

# 10) Inicia el servidor en el puerto 8080
http-server -p 8080

🌍 Paso 5: Acceder desde el Navegador

En tu equipo local, entra a:
http://IP_PUBLICA_DE_TU_EC2:8080

Si no carga, revisa que el Security Group tenga el puerto 8080 abierto y que sigues con la terminal activa.

🛑 Detener el Servidor

Presiona Ctrl + C en la terminal donde corre http-server.

🛡️ Security Group recomendado

Asegúrate de tener estas reglas:
| Tipo              | Puerto | Origen            | Descripción           |
| ----------------- | ------ | ----------------- | --------------------- |
| SSH               | 22     | Tu IP / 0.0.0.0/0 | Acceso SSH            |
| TCP Personalizado | 8080   | 0.0.0.0/0         | Acceso HTTP de prueba |

⚠️ Notas Importantes

Solo desarrollo: http-server es para pruebas, no producción.

Sin persistencia: si cierras la terminal, el sitio se apaga.

IP dinámica: al detener/iniciar la instancia, puede cambiar la IP.

Sin SSL: solo HTTP (no HTTPS). Para HTTPS usa Nginx/ALB + dominio.
