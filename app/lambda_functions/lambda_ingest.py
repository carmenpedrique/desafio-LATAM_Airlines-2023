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

    # Extraer datos del evento
    id_usuario = event.get('id_usuario')
    id_producto = event.get('id_producto')
    cantidad = event.get('cantidad')

    # Validar que el usuario existe
    cursor.execute("SELECT id FROM usuarios WHERE id = %s", (id_usuario,))
    if cursor.fetchone() is None:
        return {
            'statusCode': 400,
            'body': json.dumps('Usuario no encontrado')
        }

    # Insertar en la tabla de ordenes
    cursor.execute("INSERT INTO ordenes (id_usuario, id_producto, cantidad) VALUES (%s, %s, %s)",
                   (id_usuario, id_producto, cantidad))
    conn.commit()

    return {
        'statusCode': 200,
        'body': json.dumps('Orden creada con éxito')
    }
