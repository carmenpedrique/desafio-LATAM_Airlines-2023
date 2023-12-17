# Ejemplo de función serverless que es llamada por la API para realizar tareas

resource "aws_lambda_function" "lambda_function" {
  function_name = "my_lambda_function"
  role          = aws_iam_role.lambda_role.arn

  # Configura la imagen de ECR como origen
  image_uri        = "${ecr_repository_url}:$IMAGE_TAG"
  package_type     = "Image"

  # Asegurarse de que los logs se envíen a CloudWatch
  depends_on = [aws_cloudwatch_log_group.lambda_log_group]
}

# Logs de Lambda
resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = 14
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
      },
    ],
  })

}

# Permiso para que Lambda pueda recibir mensajes de SQS
resource "aws_lambda_permission" "lambda_sqs_permission" {
  statement_id  = "AllowExecutionFromSQS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "sqs.amazonaws.com"
  source_arn    = var.sqs_queue_arn
}

output "lambda_function_arn" {
  value = aws_lambda_function.lambda_function.arn
}
