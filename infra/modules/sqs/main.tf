resource "aws_sqs_queue" "sqs_queue" {
  name                      = "my-sqs-queue"
  visibility_timeout_seconds = 30
}

resource "aws_sns_topic_subscription" "sns_to_sqs" {
  topic_arn = var.sns_topic_arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.sqs_queue.arn
}

output "sqs_queue_arn" {
  value = aws_sqs_queue.sqs_queue.arn
}
