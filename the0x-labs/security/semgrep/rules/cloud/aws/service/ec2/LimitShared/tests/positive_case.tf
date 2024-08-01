resource "aws_ami_launch_permission" "example" {
  image_id = aws_ami.example.id
  account_id = "123456789012"
}
