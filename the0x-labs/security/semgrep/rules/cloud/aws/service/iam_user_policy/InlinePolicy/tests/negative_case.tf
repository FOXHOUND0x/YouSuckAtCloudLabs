resource "aws_iam_group" "example" {
  name = "example-group"
}

resource "aws_iam_group_policy" "example_policy" {
  name  = "example-group-policy"
  group = aws_iam_group.example.name
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "s3:ListBucket"
        Resource = "*"
      }
    ]
  })
}
