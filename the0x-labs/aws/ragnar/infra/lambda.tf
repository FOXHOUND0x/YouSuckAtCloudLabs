data "archive_file" "lambda_zip" {
    type = "zip"
    source_dir = "./lambda/"
    output_path = "./lambda.zip"
}

resource "aws_lambda_function" "ragnar_lambda" {
    filename = data.archive_file.lambda_zip.output_path
    function_name = "ragnar-lambda"
    role = aws_iam_role.ragnar_lambda_role.arn
    handler = "main.handler"
    source_code_hash = data.archive_file.lambda_zip.output_base64sha256
    runtime = "go1.x"

    environment {
        variables = {
            DYNAMO_TABLE = aws_dynamodb_table.ragnar_table.name
        }
    }
}