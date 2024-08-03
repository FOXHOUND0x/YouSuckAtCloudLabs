output "acm_cert_validation_records" {
  value = aws_acm_certificate.ragnar_cert.domain_validation_options
}

output "api_gateway_domain" {
    value = aws_apigatewayv2_domain_name.ragnar_domain.domain_name_configuration[0].target_domain_name
}