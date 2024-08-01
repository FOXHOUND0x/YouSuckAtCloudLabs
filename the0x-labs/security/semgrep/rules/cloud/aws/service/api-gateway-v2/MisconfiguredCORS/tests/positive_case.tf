resource "aws_apigatewayv2_api" "example" {
  name          = "example-api"
  protocol_type = "HTTP"

  cors_configuration {
    # Allowing all origins, which is insecure
    allow_origins = ["*"]
  }
}
