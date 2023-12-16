# Desafío DevSecOps/SRE - LATAM Airlines

Este proyecto es parte del desafío DevSecOps/SRE ofrecido por LATAM Airlines, enfocado en construir una solución robusta y escalable para la ingestión, almacenamiento y exposición de datos en un entorno de nube, implementando prácticas de DevSecOps y Site Reliability Engineering (SRE).

## Descripción General

La solución propuesta se basa en la creación de una API HTTP desarrollada en Python, utilizando infraestructura como código (IaC) para su despliegue y operaciones en la nube. El proyecto también incluye un conjunto de pruebas de integración y documentación extensiva.

## Estructura del Proyecto

El repositorio se organiza de la siguiente manera:

- `infra/`: Contiene los scripts de Terraform para la infraestructura en la nube.
- `app/`: Incluye el código fuente de la API HTTP desarrollada en Python.
- `tests/`: Alberga las pruebas de integración.
- `docs/`: Documentación adicional y diagramas de arquitectura.
- `README.md`: Este archivo, que proporciona una visión general y guía para el proyecto.

## Configuración y Despliegue

### Requisitos

- Terraform
- Python 3.8 o superior
- Docker (para contenedorización y despliegue)

### Instrucciones de Despliegue

1. **Infraestructura con Terraform:**
   - Navega a `infra/`.
   - Ejecuta `terraform init` y `terraform apply` para configurar la infraestructura.

2. **API HTTP:**
   - Navega a `app/`.
   - Ejecuta `python app.py` para iniciar la API localmente.

### Pruebas de Integración

- Ejecuta `pytest` en la carpeta `tests/` para realizar las pruebas de integración.

## Contribuciones y Mejoras Futuras

Este proyecto está abierto a contribuciones. Las áreas de mejora incluyen:

- Integración de un pipeline CI/CD completo.
- Implementación de métricas y monitoreo.
- Desarrollo de alertas y definición de SLIs/SLOs.

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
