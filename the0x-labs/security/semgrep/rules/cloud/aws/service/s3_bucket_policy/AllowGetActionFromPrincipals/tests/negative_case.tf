resource "aws_s3_bucket_policy" "secured" {
  bucket = aws_s3_bucket.secured.id
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "arn:aws:iam::123456789012:role/my-role"  # Specific principal
        Action = "s3:List"  # Allowing List action for specific principal
        Resource = aws_s3_bucket.secured.arn
      }
    ]
  })
}
