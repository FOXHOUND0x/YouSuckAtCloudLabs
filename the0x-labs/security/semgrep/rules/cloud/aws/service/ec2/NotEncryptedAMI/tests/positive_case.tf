resource "aws_ami" "example" {
  name        = "example-ami"
  description = "An example AMI"
  ebs_block_device {
    encrypted = false
    device_name = "/dev/sda1"
  }
}
