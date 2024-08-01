resource "aws_iam_user_policy" "example" {
  name = "example-policy"
  user = aws_iam_user.example.name
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "iam:*"  # Full administrative privileges
        Resource = "*"
      }
    ]
  })
}
