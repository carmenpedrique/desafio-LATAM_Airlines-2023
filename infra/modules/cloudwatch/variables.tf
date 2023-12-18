variable "aws_region" {
  description = "La región de AWS donde se desplegarán los recursos"
  type        = string
  default     = "us-west-2"
}
variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_error_evaluation_periods" {
  description = "The number of periods to evaluate for Lambda error rate alarm"
  type        = number
}

variable "lambda_error_period" {
  description = "The period, in seconds, for evaluating the Lambda error rate"
  type        = number
}

variable "lambda_error_threshold" {
  description = "The threshold for triggering the Lambda error rate alarm"
  type        = number
}

variable "rds_instance_id" {
  description = "The ID of the RDS instance"
  type        = string
}

variable "rds_cpu_utilization_evaluation_periods" {
  description = "The number of periods to evaluate for RDS CPU utilization alarm"
  type        = number
}

variable "rds_cpu_utilization_period" {
  description = "The period, in seconds, for evaluating the RDS CPU utilization"
  type        = number
}

variable "rds_cpu_utilization_threshold" {
  description = "The threshold for triggering the RDS CPU utilization alarm"
  type        = number
}

variable "sns_topic_arn" {
  description = "The ARN of the SNS topic for alarm notifications"
  type        = string
}


variable "api_gateway_name" {
  description = "El nombre de la API Gateway"
  type        = string
}

variable "api_gateway_id" {
  description = "El ID de la API Gateway"
  type        = string
}