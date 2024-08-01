resource "aws_apigatewayv2_api" "secure" {
  name          = "secure-api"
  protocol_type = "HTTP"

  cors_configuration {
    # Allowing specific origins, which is secure
    allow_origins = ["https://example.com", "https://another-example.com"]
  }
}
