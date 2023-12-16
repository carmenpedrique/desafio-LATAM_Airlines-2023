import json
import psycopg2
import os

def lambda_handler(event, context):
    # Conectar a la base de datos
    conn = psycopg2.connect(
        host=os.environ['DB_HOST'],
        dbname=os.environ['DB_NAME'],
        user=os.environ['DB_USER'],
        password=os.environ['DB_PASSWORD']
    )
    cursor = conn.cursor()

    # Extraer id_usuario del evento
    id_usuario = event.get('id_usuario')

    # Obtener órdenes del usuario
    cursor.execute("SELECT * FROM ordenes WHERE id_usuario = %s", (id_usuario,))
    ordenes = cursor.fetchall()

    return {
        'statusCode': 200,
        'body': json.dumps(ordenes)
    }
