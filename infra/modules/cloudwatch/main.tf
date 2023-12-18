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
  alarm_description   = "Alarm fires when the error rate exceeds the threshold for the Lambda function."
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
  alarm_description   = "Alarm fires when the CPU utilization exceeds the threshold for the RDS instance."
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
    // Puedes agregar más widgets según sea necesario
  ]
}
EOF
}
