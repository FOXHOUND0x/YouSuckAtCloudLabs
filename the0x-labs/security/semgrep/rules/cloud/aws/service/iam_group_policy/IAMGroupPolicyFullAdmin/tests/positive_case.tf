resource "aws_iam_group_policy" "example" {
  name = "example-policy"
  group = aws_iam_group.example.name
  
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
