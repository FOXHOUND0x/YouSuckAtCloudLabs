resource "aws_iam_group_policy" "secured" {
  name = "secured-policy"
  group = aws_iam_group.secured.name
  
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
