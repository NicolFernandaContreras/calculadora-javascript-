# 📘 Guía de Despliegue — Calculadora JS en AWS (EC2)

[![Deploy on AWS](https://img.shields.io/badge/Deploy-AWS%20EC2-orange?logo=amazon-aws&logoColor=white)](https://aws.amazon.com/ec2/)  
[![Made with JavaScript](https://img.shields.io/badge/Made%20with-JavaScript-yellow?logo=javascript&logoColor=black)](https://developer.mozilla.org/es/docs/Web/JavaScript)  
[![Powered by Node.js](https://img.shields.io/badge/Powered%20by-Node.js-green?logo=node.js&logoColor=white)](https://nodejs.org/)

☀️ **Proyecto:** Calculadora JavaScript (estática)  
📦 **Repositorio:** [github.com/NicolFernandaContreras/calculadora-javascript-](https://github.com/NicolFernandaContreras/calculadora-javascript-)  
🌐 **Servidor:** `http-server` en el puerto **8080**

Esta guía explica cómo lanzar un servidor HTTP simple para archivos estáticos (HTML/CSS/JS) en una instancia **Ubuntu EC2** de AWS.

---


## 📋 Requisitos Previos
- Instancia **EC2 (Ubuntu)** creada y corriendo.  
- **Security Group** con puertos:
  - **22 (SSH)** → para conectarte a la instancia.  
  - **8080 (HTTP)** → para acceder a la aplicación.  

---

## 🚀 Paso 1: Conectarte a tu Instancia

**Opción A: EC2 Instance Connect (recomendado)**
1. Ve a **AWS Console** → **EC2** → **Instances**.  
2. Selecciona tu instancia → **Connect** → **EC2 Instance Connect** → **Connect**.  

---

## 🔧 Paso 2: Preparar el Entorno (Ubuntu)

Ejecuta los siguientes comandos en la terminal:

```bash
# 1) Actualiza paquetes
sudo apt update

# 2) Aplica actualizaciones
sudo apt upgrade -y

# 3) Instala NVM (gestor de Node.js)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# 4) Carga NVM en la sesión actual
. "$HOME/.nvm/nvm.sh"

# 5) Instala Node.js (v22)
nvm install 22

# 6) Verifica versión instalada
node -v
