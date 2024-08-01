resource "aws_ecr_repository_policy" "example" {
  repository = aws_ecr_repository.example.id
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "ecr:*"
        Resource = "*"
      }
    ]
  })  # Public access allowed
}
