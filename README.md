# Desafío DevSecOps/SRE - LATAM Airlines

Este proyecto es parte del desafío DevSecOps/SRE ofrecido por LATAM Airlines, enfocado en construir una solución robusta y escalable para la ingestión, almacenamiento y exposición de datos en un entorno de nube, implementando prácticas de DevSecOps y Site Reliability Engineering (SRE).

## Descripción General

La solución propuesta se basa en la creación de una API HTTP desarrollada en Python, utilizando infraestructura como código (IaC) para su despliegue y operaciones en la nube. El proyecto también incluye un conjunto de pruebas de integración y estructura para una documentación extensiva.

## Parte 1: Infraestructura e IaC
La infraestructura en la nube se despliega utilizando Terraform, que organiza la infraestructura como código en los siguientes módulos:

- `modules/apigateway`: Configura el API Gateway para exponer endpoints HTTP.
- `modules/cloudwatch`: Establece el monitoreo y las alarmas para supervisar el rendimiento y la salud de la aplicación.
- `modules/lambda`: Despliega las funciones Lambda para el procesamiento de solicitudes HTTP y la gestión de la ingestión de datos.
- `modules/rds`: Implementa una base de datos PostgreSQL en AWS RDS para almacenar y recuperar información del sistema.
- `modules/sns`: Configura los tópicos SNS para el sistema Pub/Sub y para disparo de Alarmas.
- `modules/sqs`: Establece colas SQS para manejar de manera eficiente los mensajes del sistema Pub/Sub aportando excelencia operacional y resiliencia a la solución desplegada.

Se agrega `db/init_db.sql` para inicializar la base de datos PosgreSQL. 

## Parte 2: Aplicaciones y flujo CI/CD
1. API HTTP: con el despliegie del modulo terraform `modules/apigateway` se crea una API que expone los datos en la BD y habilita la ingesta via HTTP haciendo uso de las funciones desplegadas con `modules/lambda` que corren el codigo lambda_ingest y lambda_expose ubicados en `app/lambda_functions`. 
2. Para el despliegue de la aplicación y de la API en la nube de AWS se programó un flujo ubicado en `.github\workflows` que se acciona con push a las ramas main y develo en los paths app/ e infra/
3. La lógica se encuentra en `app/pub_sub` incorpora sistema Pub/Sub con la definición de tópico SNS.

## Estructura del Proyecto

El repositorio se organiza de la siguiente manera:

- `.github/workflows/`: Contiene los flujos CI/CD
- `app/`: Incluye el código fuente de la API HTTP desarrollada en Python y ejemplo pub/sub.
- `db/`: donde van los scripts para la gestión de la base de datos
- `test/`: Alberga las pruebas unitarias y de integración.
- `docs/`: Documentación adicional y de arquitectura de la solución.
- `infra/`: Contiene los scripts de Terraform para la infraestructura en la nube.
- `README.md`: Este archivo, que proporciona una visión general y guía para el proyecto.

## Supuestos y Comentarios

- Se asume que la base de datos RDS ya contiene los datos iniciales necesarios para que la API HTTP funcione correctamente tras su despliegue.
- Para la autenticación y la autorización, se presupone el uso de políticas IAM adecuadas que están fuera del alcance de este despliegue de Terraform.
- La idea es que los datos sensibles y las credenciales sean manejados a través de variables de entorno o servicios de administración de secretos de AWS, tal que no se almacenan en el repositorio de código.

### Requisitos

- Terraform
- Python 3.8 o superior
- Docker (para contenedorización y despliegue)

### Instrucciones de Despliegue manual

1. **Infraestructura con Terraform:**
   - Navega a `infra/`.
   - Ejecuta `terraform init` y `terraform apply` para configurar la infraestructura.

2. **API HTTP:**
   - Navega a `app/`.
   - Ejecuta `python app.py` para iniciar la API localmente.

### Pruebas unitarias

- Ejecuta `pytest` en la carpeta `tests/unit` para realizar las pruebas de integración.

### Pruebas de Integración

- Ejecuta `pytest` en la carpeta `tests/integration` para realizar las pruebas de integración.

## Contribuciones y Mejoras Futuras

Este proyecto está abierto a contribuciones. Las áreas de mejora incluyen:

- Implementación de agente para generación de trazas adicionales para la construcción de métricas, alertas que potencien el monitoreo activo y la Observabilidad pasiva del desempeño de la solución.
- Definición de módulos terraform para el despliegue de la misma infra en otros proveedores cloud como GCP (Cloud Functions, CloudSQL, Pub/Sub, Cloud Monitoring, ...) y Azure (AzureFunctions, Azure API Management, Azure SQL Database, Azure Monitor, ...). Esto implicaría  una estructura diferente en la carpeta de Infra y consideraciones para el proceso CI/CD amén de la restructuración y ajuste de contenidos en app/
- Implementación de estrategias de rollback
- Optimización en el proceso de versionado de recursos desplejados

## Seguridad y Mejores Prácticas

Se ha prestado especial atención a no incluir credenciales o información sensible en el repositorio. Además, se han seguido las mejores prácticas en el desarrollo, pruebas y documentación.

## Contacto

Para más información o consultas relacionadas con este proyecto, no dude en contactarme.

- **Nombre:** [Carmen Pedrique]
- **Email:** [carmen.pedrique@globant.com]

## Entrega del Desafío

Este proyecto ha sido entregado de acuerdo con las instrucciones proporcionadas en el desafío, incluyendo un POST request con los detalles requeridos.

---

*Este README es parte del Desafío DevSecOps/SRE de LATAM Airlines - SEP 2023.*
