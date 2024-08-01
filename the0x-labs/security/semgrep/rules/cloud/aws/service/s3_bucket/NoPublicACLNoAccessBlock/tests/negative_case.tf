resource "aws_s3_bucket" "secured" {
  bucket = "secured-bucket"
  acl    = "private"  # ACL is set to private
}

resource "aws_s3_bucket_policy" "secured_policy" {
  bucket = aws_s3_bucket.secured.id
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "arn:aws:iam::123456789012:role/my-role"
        Action = "s3:GetObject"
        Resource = aws_s3_bucket.secured.arn
      }
    ]
  })
}
