resource "aws_api_gateway_rest_api" "example" {
  name        = "example-api"
  description = "This is a public API Gateway."
  # No endpoint_configuration block, default is public
}
