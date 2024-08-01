resource "aws_efs_file_system_policy" "secured" {
  file_system_id = aws_efs_file_system.secured.id
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "arn:aws:iam::123456789012:role/my-role"
        Action = "elasticfilesystem:DescribeFileSystems"
        Resource = aws_efs_file_system.secured.arn  # Specific resource
      }
    ]
  })
}
