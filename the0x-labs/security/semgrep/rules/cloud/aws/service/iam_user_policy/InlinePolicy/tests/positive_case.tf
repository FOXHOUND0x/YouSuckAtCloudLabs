resource "aws_iam_user_policy" "example" {
  name = "example-policy"
  user = aws_iam_user.example.name  # Policy attached directly to a user
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "s3:ListBucket"
        Resource = "*"
      }
    ]
  })
}
