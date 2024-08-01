resource "aws_api_gateway_stage" "configured" {
  rest_api_id = aws_api_gateway_rest_api.example.id
  deployment_id = aws_api_gateway_deployment.example.id
  stage_name  = "prod"

  access_log_settings {
    destination_arn = "${aws_cloudwatch_log_group.example.arn}"
    format          = "$context.requestId"
  }
}
