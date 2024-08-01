resource "aws_iam_role_policy" "secured" {
  name = "secured-policy"
  role = aws_iam_role.secured.id
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["s3:ListBucket", "s3:GetObject"]  # Least privilege example
        Resource = "*"
      }
    ]
  })
}
