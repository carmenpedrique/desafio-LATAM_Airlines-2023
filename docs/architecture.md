# Diagrama de Arquitectura
La arquitectura propuesta incluirá los siguientes componentes:

- Amazon SNS y SQS: para la ingestión de datos utilizando el patrón Pub/Sub.
- Amazon RDS (PostgreSQL): para almacenar los datos.
- AWS Lambda: para procesar y manejar los datos recibidos por SNS/SQS.
- Amazon API Gateway: para exponer la API que interactúa con Lambda y RDS.
- AWS CloudWatch: para el monitoreo y las alertas de todos los componentes.
- CI/CD: utilizando herramientas como GitHub Actions, Jenkins o AWS CodePipeline para automatizar el despliegue de Lambda y la infraestructura con Terraform.

## Diagrama de Arquitectura 

## Explicación del Diagrama de Arquitectura

- Los mensajes se publican en un tópico de SNS, que luego distribuye los mensajes a las colas de SQS.
- Las funciones Lambda están suscritas a las colas de SQS para procesar los mensajes.
- Las funciones Lambda interactúan con la base de datos RDS para almacenar y recuperar datos.
- API Gateway actúa como una interfaz para las funciones Lambda, permitiendo a los usuarios interactuar con el sistema.
- CloudWatch se utiliza para el monitoreo y alertas del sistema.
