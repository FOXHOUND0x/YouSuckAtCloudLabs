resource "aws_apigatewayv2_api" "ragnar_api" {
  name = "ragnar-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "ragnar_stage" {
  api_id = aws_apigatewayv2_api.ragnar_api.id
  name = "ragnar-stage"
  auto_deploy = true
}

resource "aws_apigatewayv2_domain_name" "ragnar_domain" {
    depends_on = [ aws_acm_certificate.ragnar_cert ]
    
    domain_name = "ragnar.the0x.dev"
    
    domain_name_configuration {
    certificate_arn = aws_acm_certificate.ragnar_cert.arn
    endpoint_type = "REGIONAL"
    security_policy = "TLS_1_2"
  }
}

resource "aws_apigatewayv2_api_mapping" "ragnar_mapping" {
    depends_on = [ aws_apigatewayv2_domain_name.ragnar_domain ]
    
    api_id = aws_apigatewayv2_api.ragnar_api.id
    domain_name = aws_apigatewayv2_domain_name.ragnar_domain.domain_name
    stage = aws_apigatewayv2_stage.ragnar_stage.name
}