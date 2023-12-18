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

module "lambda_expose" {
  source = "./modules/lambda"
  function_name = "lambda_expose"
 
}

module "lambda_ingest" {
  source = "./modules/lambda"
  function_name = "lambda_ingest"
 
}

module "lambda_publisher" {
  source = "./modules/lambda"
  function_name = "lambda_publisher"
 
}

module "lambda_subscriber" {
  source = "./modules/lambda"
  function_name = "lambda_subscriber"
 
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
   
}

module "sns_pub_sub" {
  source = "./modules/sns/pub_sub"
  pub_sub_topic_name = "my-pub-sub-topic"
}

module "sns_alerts" {
  source = "./modules/sns/alerts"
  alerts_topic_name = "my-alerts-topic"
  email_address     = "alertas@la-empresa.com"
}

module "sqs" {
  source = "./modules/sqs"
 
}