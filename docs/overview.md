# Descripción General del Proyecto

## Objetivo

El propósito de este proyecto es desarrollar un sistema en la nube robusto y escalable para la ingestión, almacenamiento y exposición de datos. Utilizando infraestructura como código (IaC) y flujos CI/CD, el sistema garantiza pruebas de calidad, monitoreo y alertas para asegurar y monitorizar la salud del sistema.

## Arquitectura

La arquitectura del sistema se basa en varios servicios clave de AWS, incluyendo Amazon SNS, SQS, Lambda, RDS (PostgreSQL), API Gateway y CloudWatch. Esta configuración proporciona un patrón eficiente de Pub/Sub para la ingestión de datos, almacenamiento seguro y acceso eficiente a través de una API.

- **Amazon SNS y SQS:** Estos servicios trabajan en conjunto para implementar un sistema de mensajería Pub/Sub, facilitando la ingestión de datos de manera eficiente y escalable.
- **AWS Lambda:** Procesa los datos recibidos y realiza operaciones de lectura/escritura con la base de datos.
- **Amazon RDS (PostgreSQL):** Almacena los datos procesados y proporciona un acceso seguro y escalable a los mismos.
- **API Gateway:** Ofrece un punto de acceso para los usuarios o servicios que necesitan interactuar con el sistema, exponiendo las funciones Lambda como endpoints de API.
- **AWS CloudWatch:** Utilizado para el monitoreo continuo del sistema, recopilación de logs y alertas.

## CI/CD y Prácticas DevOps

Se implementan prácticas de DevOps y CI/CD para automatizar y mejorar el proceso de despliegue y mantenimiento. Esto se realiza implementando GitHub Actions.

---

*Para más detalles sobre la configuración e instalación del proyecto, consulte el archivo [setup.md](setup.md).*
