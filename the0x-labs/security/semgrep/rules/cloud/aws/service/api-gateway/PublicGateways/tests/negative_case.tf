resource "aws_api_gateway_rest_api" "private" {
  name        = "private-api"
  description = "This is a private API Gateway."

  endpoint_configuration {
    types = ["PRIVATE"]  # Properly configured as private
  }
}
