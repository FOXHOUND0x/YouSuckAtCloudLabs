resource "aws_launch_configuration" "secured" {
  name          = "secured-launch-configuration"
  image_id      = "ami-87654321"
  instance_type = "t2.micro"
  
  iam_instance_profile = aws_iam_role.limited_role.name  # Least privilege IAM role
}

resource "aws_iam_role" "limited_role" {
  name = "limited-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["s3:ListBucket", "s3:GetObject"]  # Least privilege example
        Resource = "*"
      }
    ]
  })
}
