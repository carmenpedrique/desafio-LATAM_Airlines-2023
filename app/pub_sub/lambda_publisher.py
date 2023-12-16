# Función que publica mensajes en un tópico SNS

import boto3
import json

sns_client = boto3.client('sns')
sns_topic_arn = 'your-sns-topic-arn'

def lambda_handler(event, context):
    # Suponiendo que el 'event' contiene el mensaje a publicar
    message = event.get('message', 'Mensaje predeterminado')

    response = sns_client.publish(
        TopicArn=sns_topic_arn,
        Message=json.dumps({'default': json.dumps(message)}),
        MessageStructure='json'
    )

    return {
        'statusCode': 200,
        'body': json.dumps('Mensaje publicado con éxito en SNS'),
        'response': response
    }
