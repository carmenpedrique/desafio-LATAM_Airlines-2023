import requests
import json

def test_ingest_endpoint_accepts_data():
    api_url = "https://your-api-gateway-url/ingest"

    # Datos a enviar en la solicitud POST
    data = {
        "id_usuario": 1,
        "id_producto": 101,
        "cantidad": 2
    }

    # Realizar la solicitud POST
    response = requests.post(api_url, json=data)

    # Verificar que el código de estado es 200 (OK)
    assert response.status_code == 200

    # Verificar la respuesta
    response_data = response.json()
    assert response_data.get('message') == 'Datos procesados con éxito'
