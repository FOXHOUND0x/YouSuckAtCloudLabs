resource "aws_secretsmanager_secret_policy" "secured" {
  secret_arn = aws_secretsmanager_secret.secured.arn
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "arn:aws:iam::123456789012:role/my-role"
        Action = "secretsmanager:GetSecretValue"
        Resource = aws_secretsmanager_secret.secured.arn  # Specific resource
      }
    ]
  })
}
