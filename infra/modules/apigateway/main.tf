resource "aws_api_gateway_rest_api" "api" {
  name        = var.api_gateway_name
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

# Habilitar la recopilación de logs para API Gateway
resource "aws_api_gateway_stage" "logs_prod" {
  stage_name    = "prod"
  rest_api_id   = aws_api_gateway_rest_api.api.id
  deployment_id = aws_api_gateway_deployment.logs_prod.id

  # Configurar la recopilación de logs
  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.api_logs.arn
    format          = jsonencode({
      httpRequest = {
        clientIp = "$context.identity.sourceIp",
        method   = "$context.httpMethod",
        user     = "$context.identity.user",
        path     = "$context.resourcePath",
        status   = "$context.status",
        protocol = "$context.protocol",
        responseLength = "$context.responseLength"
      }
    })
  }
}

resource "aws_cloudwatch_log_group" "api_logs" {
  name = "/aws/apigateway/${var.api_gateway_name}"

  retention_in_days = 7
}

