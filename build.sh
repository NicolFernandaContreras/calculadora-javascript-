#!/bin/bash

echo "🧪 Ejecutando pruebas..."
docker build --target testing -t calculadora-test .

if [ $? -ne 0 ]; then
    echo "❌ Las pruebas fallaron. No se construirá la imagen de producción."
    exit 1
fi

echo "✅ Pruebas pasaron exitosamente!"

echo "🚀 Construyendo imagen de producción..."
docker build --target production -t calculadora-app .

if [ $? -eq 0 ]; then
    echo "✅ Imagen de producción construida exitosamente!"
    echo "📝 Para ejecutar la aplicación:"
    echo "   docker run -p 8080:8080 calculadora-app"
else
    echo "❌ Error construyendo imagen de producción."
fi
