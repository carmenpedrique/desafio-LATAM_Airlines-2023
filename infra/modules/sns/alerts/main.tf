resource "aws_sns_topic" "alerts_topic" {
  name = var.alerts_topic_name
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alerts_topic.arn
  protocol  = "email"
  endpoint  = var.email_address
}

 
