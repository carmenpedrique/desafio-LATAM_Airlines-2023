variable "lambda_ingest_arn" {
  description = "ARN de la función Lambda para la ingesta de datos"
  type        = string
}

variable "lambda_expose_arn" {
  description = "ARN de la función Lambda para la exposición de datos"
  type        = string
}

variable "api_gateway_name" {
  description = "El nombre de la API Gateway"
  type        = string
}
