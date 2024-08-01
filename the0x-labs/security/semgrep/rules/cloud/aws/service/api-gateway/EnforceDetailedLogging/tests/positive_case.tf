resource "aws_api_gateway_method_settings" "example" {
  rest_api_id = aws_api_gateway_rest_api.example.id
  method_path = join("/", ["pets", "GET"])
  stage_name  = "prod"
  settings {
    metrics_enabled = false
  }
}
