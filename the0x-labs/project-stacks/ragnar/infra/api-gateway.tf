# resource "aws_api_gateway_rest_api" "ragnar_api" {
#     name = "ragnar-api"
# }

# resource "aws_api_gateway_resource" "ragnar_resource" {
#     rest_api_id = aws_api_gateway_rest_api.ragnar_api.id
#     parent_id = aws_api_gateway_rest_api.ragnar_api.root_resource_id
#     path_part = "ragnar"
# }

# resource "aws_api_gateway_method" "ragnar_method" {
#     rest_api_id = aws_api_gateway_rest_api.ragnar_api.id
#     resource_id = aws_api_gateway_resource.ragnar_resource.id
#     http_method = "POST"
#     authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "ragnar_integration" {
#     rest_api_id = aws_api_gateway_rest_api.ragnar_api.id
#     resource_id = aws_api_gateway_resource.ragnar_resource.id
#     http_method = aws_api_gateway_method.ragnar_method.http_method
#     integration_http_method = "POST"
#     type = "AWS_PROXY"
#     uri = aws_lambda_function.ragnar_lambda.invoke_arn
# }

# resource "aws_api_gateway_deployment" "ragnar_deployment" {
#     depends_on = [aws_api_gateway_integration.ragnar_integration]
#     rest_api_id = aws_api_gateway_rest_api.ragnar_api.id
#     stage_name = "dev"
# }

