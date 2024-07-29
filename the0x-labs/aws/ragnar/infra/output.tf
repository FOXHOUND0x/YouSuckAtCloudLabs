output "api_url" {
    value = aws_api_gateway_deployment.ragnar_deployment.invoke_url
}