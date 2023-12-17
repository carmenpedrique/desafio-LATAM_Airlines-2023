#!/bin/bash

# Definir variables
IMAGE_TAG=$(git rev-parse --short HEAD)  # Obtiene el hash del commit actual

# Obtener la URI del repositorio de ECR
ECR_URI=$(aws ecr describe-repositories --repository-names "${REPOSITORY_NAME}" --query 'repositories[0].repositoryUri' --output text)

# Autenticar Docker con ECR
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin $ECR_URI

# Construir la imagen de Docker
docker build -t $REPOSITORY_NAME .

# Etiquetar la imagen con la URI de ECR y el tag
docker tag $REPOSITORY_NAME:latest $ECR_URI:$IMAGE_TAG

# Subir la imagen a ECR
docker push $ECR_URI:$IMAGE_TAG
