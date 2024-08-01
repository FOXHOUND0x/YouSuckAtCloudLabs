resource "aws_api_gateway_stage" "example" {
  rest_api_id = aws_api_gateway_rest_api.example.id
  deployment_id = aws_api_gateway_deployment.example.id
  stage_name  = "prod"
  # Missing access_log_settings block
}
