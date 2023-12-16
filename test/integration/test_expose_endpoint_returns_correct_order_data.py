import requests
import json

def test_api_gateway_expose_endpoint():
    # URL del endpoint de la API Gateway
    api_url = "https://your-api-gateway-url/expose"
    
    # Parámetros para la solicitud GET
    params = {'id_usuario': 1}
    
    # Realizar la solicitud GET
    response = requests.get(api_url, params=params)

    # Aserciones para el código de estado
    assert response.status_code == 200

    # Aserciones para el contenido de la respuesta
    data = response.json()

    # Verificar que la respuesta es una lista (suponiendo que se espera una lista de órdenes)
    assert isinstance(data, list)

    # Verificar que cada elemento en la lista tenga la estructura esperada
    # Esta parte dependerá de cómo esté estructurada tu respuesta específica
    for item in data:
        assert 'id_orden' in item
        assert 'id_producto' in item
        assert 'cantidad' in item

    # Otras aserciones pueden incluir verificar la longitud de la lista, valores específicos, etc.
    # Por ejemplo, si esperas datos específicos, puedes verificarlos así:
    # assert data[0]['id_producto'] == esperado_id_producto

    # Aserciones adicionales pueden ser añadidas según lo que tu API específica deba devolver
