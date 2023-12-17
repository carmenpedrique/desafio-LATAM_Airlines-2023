# Usar una imagen base de Python proporcionada por AWS
FROM public.ecr.aws/lambda/python:3.8

# Copiar los archivos de la función Lambda y los requisitos
COPY lambda_functions/ /var/task/lambda_functions/
COPY requirements.txt /var/task/

# Instalar las dependencias de Python
RUN pip install -r requirements.txt

# Establecer el comando por defecto para ejecutar las funciones Lambda
CMD [ "lambda_functions.lambda_handler" ]
