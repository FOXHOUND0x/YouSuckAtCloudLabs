resource "aws_lb_target_group" "example" {
  name     = "example-target-group"
  port     = 80
  protocol = "HTTP"  # Target group using HTTP

  health_check {
    protocol = "HTTP"  # Health check using HTTP
  }
}
