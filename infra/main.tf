provider "aws" {
  region = var.region
}

module "rds" {
  source = "./modules/rds"
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

module "apigateway" {
  source = "./modules/apigateway"
  lambda_ingest_arn = module.lambda.lambda_ingest_arn
  lambda_expose_arn = module.lambda.lambda_expose_arn
}


module "lambda" {
  source = "./modules/lambda"
  # Pasar variables necesarias para el módulo Lambda
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
  # Pasar variables necesarias para el módulo CloudWatch
}

module "sns_pub_sub" {
  source = "./modules/sns/pub_sub"
  pub_sub_topic_name = "my-pub-sub-topic"
}

module "sns_alerts" {
  source = "./modules/sns/alerts"
  alerts_topic_name = "my-alerts-topic"
  email_address     = "example@example.com"
}


