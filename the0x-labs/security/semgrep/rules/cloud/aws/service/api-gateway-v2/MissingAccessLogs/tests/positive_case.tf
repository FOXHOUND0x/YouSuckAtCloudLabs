resource "aws_apigatewayv2_api_stage" "example" {
  api_id = aws_apigatewayv2_api.example.id
  name   = "example-stage"
  # Missing access_log_settings block
}
