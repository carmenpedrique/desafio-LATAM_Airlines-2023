output "api_endpoint_ingest" {
  value = "${aws_api_gateway_rest_api.api.execution_arn}/ingest"
}

output "api_endpoint_expose" {
  value = "${aws_api_gateway_rest_api.api.execution_arn}/expose"
}
