resource "aws_ebs_volume" "secured" {
  availability_zone = "us-east-1a"
  size              = 20
  encrypted         = true  # Snapshot encryption is enabled
}
