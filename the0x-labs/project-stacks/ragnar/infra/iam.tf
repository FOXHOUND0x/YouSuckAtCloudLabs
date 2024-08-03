resource "aws_iam_role" "ragnar_lambda_role" {
    name = "ragnar-lambda-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "lambda.amazonaws.com"
                }
            }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
    role = aws_iam_role.ragnar_lambda_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy" "ragnar_lambda_policy" {
    name = "ragnar-lambda-policy"
    role = aws_iam_role.ragnar_lambda_role.name
    policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Action = [
                    "s3:GetObject",
                    "s3:PutObject",
                    "s3:ListBucket"
                ]
                Effect = "Allow"
                Resource = [
                    "${aws_s3_bucket.ragnar_bucket.arn}",
                    "${aws_s3_bucket.ragnar_bucket.arn}/*"
                ]
            }
        ]
    })
}