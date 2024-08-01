resource "aws_ami_launch_permission" "not_shared" {
  image_id = aws_ami.example.id
  # No account_id specified, hence not shared
}
