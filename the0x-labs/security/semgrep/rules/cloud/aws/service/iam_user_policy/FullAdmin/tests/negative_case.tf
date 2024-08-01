resource "aws_iam_user_policy" "secured" {
  name = "secured-policy"
  user = aws_iam_user.secured.name
  
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
