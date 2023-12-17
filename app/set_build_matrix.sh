#!/bin/bash

# Inicializar la matriz con un valor vacío
build_matrix="[]"

# Lista de directorios de funciones Lambda
lambda_dirs=("lambda_functions" "pub_sub")

# Iterar sobre los directorios de funciones Lambda
for dir in "${lambda_dirs[@]}"; do
  # Verificar si hay cambios en el directorio de la función Lambda
  if git diff --name-only ${{ github.event.before }} ${{ github.event.after }} | grep -q "$dir"; then
    # Agregar el directorio a la matriz de construcción si hay cambios
    build_matrix=$(jq -nc --argjson arr "$build_matrix" --arg dir "$dir" '$arr + [$dir]')
  fi
done

# Establecer la salida de la matriz de construcción
echo "::set-output name=matrix::$build_matrix"
