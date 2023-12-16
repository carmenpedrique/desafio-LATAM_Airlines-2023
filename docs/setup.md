# Configuración e Instalación

Este documento proporciona instrucciones detalladas para configurar e instalar los componentes necesarios para el proyecto.

## Requisitos Previos

Antes de comenzar, asegúrate de tener lo siguiente:

- Una cuenta de AWS con los permisos necesarios.
- Terraform instalado en tu máquina local.
- Acceso a la línea de comandos de AWS configurado.
- Git instalado en tu sistema.

## Configuración de AWS

1. **Configura tus credenciales de AWS:**
   - Asegúrate de que tus credenciales de AWS estén configuradas correctamente en tu máquina. Esto puede hacerse mediante el comando `aws configure`.

2. **KMS Key:**
   - Si aún no tienes una, crea una clave KMS en AWS para la encriptación de la base de datos RDS.

## Configuración de Terraform

1. **Inicialización de Terraform:**
   - Navega al directorio raíz del proyecto y ejecuta `terraform init`. Esto inicializará Terraform y descargará los módulos y proveedores necesarios.

2. **Planificación y Aplicación:**
   - Ejecuta `terraform plan` para ver los cambios que se aplicarán.
   - Ejecuta `terraform apply` para aplicar la configuración de infraestructura.

## Configuración de la API y Lambda

1. **Despliegue de Lambda:**
   - Asegúrate de que tu función Lambda esté empaquetada y lista para desplegarse (puedes necesitar un archivo `buildspec.yml` si estás utilizando AWS CodeBuild).

2. **Configuración del API Gateway:**
   - Configura las rutas y métodos en API Gateway que apunten a tus funciones Lambda.

## Monitoreo con CloudWatch

- Revisa y configura las métricas y alertas en CloudWatch según tus necesidades para monitorear la salud del sistema.

---

*Para más detalles sobre la arquitectura y los componentes del sistema, consulte el archivo [architecture.md](architecture.md).*
