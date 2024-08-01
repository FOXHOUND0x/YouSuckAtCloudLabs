resource "aws_iam_role_policy" "example" {
  name = "example-policy"
  role = aws_iam_role.example.id
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "iam:*"  # Privilege escalation risk
        Resource = "*"
      }
    ]
  })
}
