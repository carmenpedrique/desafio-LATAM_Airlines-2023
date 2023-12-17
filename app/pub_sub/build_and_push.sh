#!/bin/bash

# Definir variables
IMAGE_TAG=lambda-pubsub

# Login en ECR
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin ${ECR_REPOSITORY}

# Construir la imagen
docker build -t ${IMAGE_TAG} .

# Etiquetar la imagen para el repositorio ECR
docker tag ${IMAGE_TAG}:latest ${ECR_REPOSITORY}:${IMAGE_TAG}

# Subir la imagen a ECR
docker push ${ECR_REPOSITORY}:${IMAGE_TAG}
