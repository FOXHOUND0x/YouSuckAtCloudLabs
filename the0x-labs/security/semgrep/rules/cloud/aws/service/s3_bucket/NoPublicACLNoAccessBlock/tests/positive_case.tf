resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"
  acl    = "public-read"  # Public access allowed
}

resource "aws_s3_bucket_policy" "example_policy" {
  bucket = aws_s3_bucket.example.id
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:*"
        Resource = aws_s3_bucket.example.arn  # Public access allowed
      }
    ]
  })
}
