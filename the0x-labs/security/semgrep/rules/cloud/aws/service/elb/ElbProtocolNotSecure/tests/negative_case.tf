resource "aws_elb" "secured" {
  name               = "secured-elb"
  availability_zones = ["us-east-1a", "us-east-1b"]

  listener {
    instance_port     = 443
    instance_protocol = "HTTPS"
    lb_port           = 443
    lb_protocol       = "HTTPS"
  }
}
