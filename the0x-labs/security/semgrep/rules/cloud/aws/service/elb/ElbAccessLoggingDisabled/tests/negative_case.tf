resource "aws_elb" "secured" {
  name               = "secured-elb"
  availability_zones = ["us-east-1a", "us-east-1b"]

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  access_logs {
    enabled = true  # Access logging is enabled
    bucket  = "my-elb-logs"  # S3 bucket for logs
  }
}
