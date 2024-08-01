resource "aws_ami" "example_encrypted" {
  name        = "example-encrypted-ami"
  description = "An encrypted example AMI"
  ebs_block_device {
    encrypted = true
    device_name = "/dev/sda1"
  }
}
