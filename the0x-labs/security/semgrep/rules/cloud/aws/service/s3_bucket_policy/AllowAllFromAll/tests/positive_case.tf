resource "aws_s3_bucket_policy" "example" {
  bucket = aws_s3_bucket.example.id
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"  # Allowing access from all principals
        Action = "s3:Get"  # Allowing Get action
        Resource = aws_s3_bucket.example.arn
      }
    ]
  })
}
