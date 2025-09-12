# Script para construir y probar la aplicación

Write-Host "🧪 Ejecutando pruebas..." -ForegroundColor Yellow
docker build --target testing -t calculadora-test .

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Las pruebas fallaron. No se construirá la imagen de producción." -ForegroundColor Red
    exit 1
}

Write-Host "✅ Pruebas pasaron exitosamente!" -ForegroundColor Green

Write-Host "🚀 Construyendo imagen de producción..." -ForegroundColor Yellow
docker build --target production -t calculadora-app .

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Imagen de producción construida exitosamente!" -ForegroundColor Green
    Write-Host "📝 Para ejecutar la aplicación:" -ForegroundColor Cyan
    Write-Host "   docker run -p 8080:8080 calculadora-app" -ForegroundColor White
} else {
    Write-Host "❌ Error construyendo imagen de producción." -ForegroundColor Red
}
