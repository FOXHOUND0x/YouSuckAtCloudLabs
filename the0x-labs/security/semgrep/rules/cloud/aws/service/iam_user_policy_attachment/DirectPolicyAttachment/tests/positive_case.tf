resource "aws_iam_user_policy_attachment" "example" {
  user       = "example-user"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
