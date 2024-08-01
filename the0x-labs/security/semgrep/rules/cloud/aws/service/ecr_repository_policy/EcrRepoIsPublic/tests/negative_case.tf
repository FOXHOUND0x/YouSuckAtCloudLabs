resource "aws_ecr_repository_policy" "secured" {
  repository = aws_ecr_repository.secured.id
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "arn:aws:iam::123456789012:role/my-role"
        Action = "ecr:*"
        Resource = aws_ecr_repository.secured.arn
      }
    ]
  })  # Access restricted to specific IAM role
}
