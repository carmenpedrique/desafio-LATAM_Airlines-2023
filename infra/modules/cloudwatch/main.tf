# Alarma para errores en API Gateway
resource "aws_cloudwatch_metric_alarm" "api_gateway_high_error_rate" {
  alarm_name          = "api-gateway-high-error-rate-${var.api_gateway_id}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "5XXError"
  namespace           = "AWS/ApiGateway"
  period              = 60
  statistic           = "Sum"
  threshold           = 10
  alarm_description   = "Alarma disparada cuando la tasa de errores 5XX excede el umbral establecido para la API Gateway."
  alarm_actions       = [var.sns_topic_arn]

  dimensions = {
    ApiName = var.api_gateway_name
  }
}

# Alarma para errores en Lambda
resource "aws_cloudwatch_metric_alarm" "lambda_high_error_rate" {
  alarm_name          = "lambda-high-error-rate-${var.lambda_function_name}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.lambda_error_evaluation_periods
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = var.lambda_error_period
  statistic           = "Sum"
  threshold           = var.lambda_error_threshold
  alarm_description   = "Alarma disparada cuando la tasa de error excede el umbral establecido para la función lambda."
  alarm_actions       = [var.sns_topic_arn]

  dimensions = {
    FunctionName = var.lambda_function_name
  }
}

# Alarma para alta utilización de CPU en RDS
resource "aws_cloudwatch_metric_alarm" "rds_high_cpu_usage" {
  alarm_name          = "rds-high-cpu-usage-${var.rds_instance_id}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.rds_cpu_utilization_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = var.rds_cpu_utilization_period
  statistic           = "Average"
  threshold           = var.rds_cpu_utilization_threshold
  alarm_description   = "Alarma disparada cuando la utilización del CPU excede el umbral establecido para la instancia RDS."
  alarm_actions       = [var.sns_topic_arn]

  dimensions = {
    DBInstanceIdentifier = var.rds_instance_id
  }
}


# Dashboard de CloudWatch
resource "aws_cloudwatch_dashboard" "main_dashboard" {
  dashboard_name = "LATAM_AirlinesDashboard"

  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          ["AWS/Lambda", "Invocations", "FunctionName", "${var.lambda_function_name}"],
          [".", "Errors", ".", "."]
        ],
        "period": 300,
        "stat": "Sum",
        "title": "Invocaciones y errores de Lambda"
      }
    },
    {
        type = "metric",
        x    = 12,
        y    = 0,
        width = 12,
        height = 6,
        properties = {
          metrics = [
            ["AWS/ApiGateway", "5XXError", "ApiName", var.api_gateway_name, { "stat": "Sum", "period": 60 }],
            ["AWS/ApiGateway", "Latency", "ApiName", var.api_gateway_name, { "stat": "Average", "period": 60 }]
          ],
          view   = "timeSeries",
          stacked = false,
          title  = "Errores 5XX y Latencia de API Gateway",
          region = "us-west-2"
        },
    {
      "type": "metric",
      "x": 0,
      "y": 6,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          ["AWS/RDS", "CPUUtilization", "DBInstanceIdentifier", "${aws_db_instance.default.id}"]
        ],
        "period": 60,
        "stat": "Average",
        "title": "Utilización CPU RDS"
      }
    }
  ]
}
EOF
}
