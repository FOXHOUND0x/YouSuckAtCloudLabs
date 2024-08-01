resource "aws_iam_access_key" "example" {
  user = aws_iam_user.example.name  # Access key associated with a user
}
