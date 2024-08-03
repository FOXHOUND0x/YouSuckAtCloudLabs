resource "aws_lambda_function" "ragnar_lambda" {
    filename = "lambda.zip"
    function_name = "ragnar-lambda"
    role = aws_iam_role.ragnar_lambda_role.arn
    handler = "lambda.handler"
    runtime = "provided.al2"
    architectures = [ "x86_64" ]
    environment {
        variables = {
            BUCKET_NAME = aws_s3_bucket.ragnar_bucket.bucket
        }
    }
}