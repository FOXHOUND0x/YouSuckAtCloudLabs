resource "aws_efs_file_system_policy" "example" {
  file_system_id = aws_efs_file_system.example.id
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "elasticfilesystem:*"
        Resource = "*"  # Wildcard policy is attached
      }
    ]
  })
}
