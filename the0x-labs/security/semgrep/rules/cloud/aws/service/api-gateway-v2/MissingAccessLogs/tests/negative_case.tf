resource "aws_apigatewayv2_api_stage" "secure" {
  api_id = aws_apigatewayv2_api.example.id
  name   = "secure-stage"

  access_log_settings {
    destination_arn = "${aws_cloudwatch_log_group.example.arn}"
    format          = "$context.requestId"
  }
}
