output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "api_gateway_endpoint" {
  value = module.apigateway.api_gateway_endpoint
}
