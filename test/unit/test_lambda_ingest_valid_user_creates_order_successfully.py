import pytest
from lambda_ingest import lambda_handler
from unittest.mock import patch, MagicMock

@patch("lambda_ingest.psycopg2.connect")
def test_lambda_ingest_valid_user(mock_connect):
    mock_cursor = MagicMock()
    mock_connect.return_value.cursor.return_value = mock_cursor
    mock_cursor.fetchone.return_value = [1]  # Simula un usuario encontrado

    response = lambda_handler({"id_usuario": 1, "id_producto": 2, "cantidad": 5}, None)
    assert response['statusCode'] == 200
    assert "Orden creada con éxito" in response['body']
