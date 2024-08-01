resource "aws_iam_role" "ragnar_lambda_role" {
    name = "ragnar-lambda-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Pincipal = {
                    Service = "lambda.amazonaws.com"
                }
            }
        ]
    })
}

resource "aws_iam_role_policy" "ragnar_iam_policy" {
    name = "ragnar-lambda-policy"
    role = aws_iam_role.ragnar_lambda_role.id
    policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Action = [
                    "dynamodb:GetItem",
                    "dynamodb:PutItem",
                    "dynamodb:UpdateItem",
                    "dynamodb:DeleteItem"
                ]
                Resource = aws_dynamodb_table.ragnar_table.arn
            },
            {
                Effect = "Allow"
                Action = [
                    "logs:CreateLogGroup",
                    "logs:CreateLogStream",
                    "logs:PutLogEvents"
                ]
                resource = "arn:aws:logs:*:*:*"
            }
        ]
    })
}

resource "aws_lambda_permission" "ragnar_lambda_permission" {
    statement_id = "AllowExecutionFromAPIGateway"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.ragnar_lambda.function_name
    principal = "apigateway.amazonaws.com"
    source_arn = "${aws_api_gateway_rest_api.ragnar_api.execution_arn}/*/*"
}