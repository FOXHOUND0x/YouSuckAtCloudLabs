resource "aws_iam_access_key" "root_access_key" {
  user = "root"  # Access key associated with the root account
}
