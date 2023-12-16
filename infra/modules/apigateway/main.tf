resource "aws_api_gateway_rest_api" "api" {
  name        = "MyDataAPI"
  description = "API para gestión de datos"
}

# Recurso para la ingesta de datos
resource "aws_api_gateway_resource" "ingest_resource" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "ingest"
}

resource "aws_api_gateway_method" "ingest_post" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.ingest_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "ingest_post_lambda" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.ingest_resource.id
  http_method = aws_api_gateway_method.ingest_post.http_method
  type        = "AWS_PROXY"
  uri         = aws_lambda_function.lambda_function_ingest.invoke_arn
}

# Recurso para la exposición de datos
resource "aws_api_gateway_resource" "expose_resource" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "expose"
}

resource "aws_api_gateway_method" "expose_get" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.expose_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "expose_get_lambda" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.expose_resource.id
  http_method = aws_api_gateway_method.expose_get.http_method
  type        = "AWS_PROXY"
  uri         = aws_lambda_function.lambda_function_expose.invoke_arn
}
