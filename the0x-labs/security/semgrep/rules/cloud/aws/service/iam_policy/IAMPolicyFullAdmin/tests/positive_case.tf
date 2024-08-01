resource "aws_iam_policy" "example" {
  name   = "example-policy"
  
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
