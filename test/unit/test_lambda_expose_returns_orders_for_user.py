import pytest
from test.test_lambda_expose_returns_orders_for_user import lambda_handler
from unittest.mock import patch, MagicMock

@patch("lambda_expose.psycopg2.connect")
def test_lambda_expose(mock_connect):
    mock_cursor = MagicMock()
    mock_connect.return_value.cursor.return_value = mock_cursor
    mock_cursor.fetchall.return_value = [("orden1", "producto1", 1)]

    response = lambda_handler({"id_usuario": 1}, None)
    assert response['statusCode'] == 200
    assert "orden1" in response['body']
