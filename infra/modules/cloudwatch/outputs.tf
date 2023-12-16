output "lambda_log_group_name" {
  value = aws_cloudwatch_log_group.lambda_log_group.name
}

output "dashboard_name" {
  value = aws_cloudwatch_dashboard.main_dashboard.dashboard_name
}