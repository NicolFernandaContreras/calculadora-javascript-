🌐 Guía de Desarrollo – Node.js y Django en AWS (EC2)
🧮 Proyecto 1: Calculadora en JavaScript

Aplicación simple en Node.js que corre con un servidor local usando http-server.

📋 Requisitos Previos

Instancia EC2 creada y corriendo (Ubuntu recomendado).

Security Group con puertos abiertos: 22 (SSH) y 8080.

Acceso SSH a la instancia.

🚀 Paso 1: Conectarse a la Instancia EC2

Usa EC2 Instance Connect o tu clave .pem:

ssh -i tu_clave.pem ubuntu@tu-ip-publica
