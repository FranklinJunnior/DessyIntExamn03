#!/bin/bash

echo "Iniciando despliegue..."

# Clonar el primer repositorio y ejecutar el script deploy.sh
git clone https://github.com/olivercorrea/online_machine_learning_for_music_recommendation1.git
cd online_machine_learning_for_music_recommendation1
git switch automatizacion_v1
chmod +x deploy.sh
./deploy.sh

# Batch
cd ..


# Clonar el segundo repositorio
git clone https://github.com/JancoF/examenig examenig && cd examenig

# Verificar si estamos en el directorio correcto y que docker-compose.yml existe
if [ ! -f "docker-compose.yml" ]; then
  echo "Error: No se encuentra el archivo docker-compose.yml"
  exit 1
fi

echo "Construyendo imágenes..."
docker-compose build

echo "Desplegando servicios..."
docker-compose up -d

echo "Proyecto desplegado"
echo "Despliegue Terminado"
