resource "aws_iam_access_key" "user_access_key" {
  user = aws_iam_user.example.name  # Access key associated with a non-root user
}
