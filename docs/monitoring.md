# Monitoreo y Alertas

## Visión General

Nuestra infraestructura en AWS incluye estrategias integrales de monitoreo y alertas para garantizar la confiabilidad y el rendimiento de los servicios. Utilizamos AWS CloudWatch para el monitoreo en tiempo real de nuestros recursos, como las funciones AWS Lambda y las instancias de RDS.

## Alarmas de CloudWatch

Hemos configurado dos alarmas críticas de CloudWatch:

1. **Alarma de Tasa de Errores de Lambda**: Se activa si la tasa de errores de la función Lambda supera el umbral predefinido. Esto ayuda a identificar y mitigar rápidamente problemas en la ejecución de Lambda.

2. **Alarma de Alta Utilización de CPU de RDS**: Alerta cuando la utilización de CPU de la instancia de RDS supera el umbral esperado, indicando posibles problemas de rendimiento o actividad inusual.

3. **Tasa de Errores API Gateway**: Una alarma se dispara si la cantidad de errores 5XX de la API Gateway supera un umbral definido en un periodo de tiempo específico.

4. **Latencia API Gateway**: Una alarma se activa si la latencia promedio de las respuestas de la API excede un umbral, lo que podría indicar problemas de rendimiento o cuellos de botella en la infraestructura.

Estas alarmas están configuradas para enviar notificaciones a un tema SNS, que está configurado para reenviar estas notificaciones al equipo responsable a través de correo electrónico.

## Dashboard de CloudWatch

Se ha configurado un Dashboard de CloudWatch llamado `LATAM_AirlinesDashboard` para proporcionar una vista consolidada de métricas clave de rendimiento. Incluye widgets para:

- Errores y Latencia de la API Gateway: Se puede visualizar la latencia promedio, ayudando a identificar  problemas de rendimiento que precisen atención y, con otro widget observar la tasa de errores y picos de estos en tiempo real. 

- Invocaciones y Errores de Lambda: Monitorea el número total de invocaciones y errores de las funciones Lambda, proporcionando una visión de su salud y actividad.
  
- Utilización de CPU de RDS: Muestra el uso promedio de CPU de la instancia de RDS, permitiéndonos monitorear y escalar la base de datos adecuadamente.

La observabilidad no solo mejora nuestra capacidad para operar la API de manera efectiva, sino que también ofrece insights que impulsan la toma de decisiones basadas en datos y la mejora continua de la plataforma.

## Mejores Prácticas

- **Alertas Accionables**: Todas las alertas configuradas son accionables, lo que significa que requieren una respuesta inmediata cuando se activan.
  
- **Umbrales**: Los umbrales para las alarmas se establecen en base a datos históricos de rendimiento y la carga anticipada, asegurando que sean sensibles y específicos a problemas reales.

- **Revisión y Ajuste**: Las configuraciones de alarmas y los umbrales se revisan y ajustan regularmente en base a nuevas percepciones y cambios en los patrones de uso de la aplicación.

## Mejoras Futuras

- **Métricas Adicionales**: Planeamos añadir más métricas a nuestro Dashboard de CloudWatch para una experiencia de monitoreo más completa.
  
- **Respuestas Automatizadas**: Nuestro objetivo es implementar respuestas automatizadas utilizando AWS Lambda para ciertos tipos de alertas para una mitigación más rápida.

El monitoreo y las alertas son partes vitales de nuestra estrategia de excelencia operacional, asegurando la alta disponibilidad y rendimiento de nuestras aplicaciones.
