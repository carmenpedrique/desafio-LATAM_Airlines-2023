# Usar una imagen base de Python
FROM public.ecr.aws/lambda/python:3.8

# Copiar los archivos de la función Lambda
COPY pub_sub/lambda_publisher.py ./pub_sub/
COPY pub_sub/lambda_subscriber.py ./pub_sub/

# Instalar dependencias
COPY requirements.txt .
RUN pip install -r requirements.txt

# Establecer el comando por defecto para ejecutar las funciones Lambda
CMD ["app.lambda_handler"]
