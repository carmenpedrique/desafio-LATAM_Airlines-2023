# Es la función Lambda que será invocada por mensajes en una cola SQS, los procesará y realizará la lógica necesaria.
import json

def lambda_handler(event, context):
    # Procesa cada mensaje en el lote
    for record in event['Records']:
        # Extrae el cuerpo del mensaje
        message_body = record['body']
        message = json.loads(message_body)
        
        # Aquí puedes agregar la lógica para procesar el mensaje
        print(f"Procesando mensaje: {message}")

    return {
        'statusCode': 200,
        'body': json.dumps('Mensajes procesados con éxito')
    }
