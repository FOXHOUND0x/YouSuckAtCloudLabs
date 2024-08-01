resource "aws_launch_configuration" "example" {
  name          = "example-launch-configuration"
  image_id      = "ami-12345678"
  instance_type = "t2.micro"
  
  enable_monitoring = false  # CloudWatch monitoring is disabled
}
