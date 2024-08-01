resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 20
  encrypted         = true  # EBS volume is encrypted
  kms_key_id       = null   # No KMS key specified
}
