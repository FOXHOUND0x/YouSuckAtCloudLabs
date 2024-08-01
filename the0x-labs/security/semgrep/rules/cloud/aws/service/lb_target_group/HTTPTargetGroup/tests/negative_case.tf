resource "aws_lb_target_group" "secured" {
  name     = "secured-target-group"
  port     = 443
  protocol = "HTTPS"  # Target group using HTTPS

  health_check {
    protocol = "HTTPS"  # Health check using HTTPS
  }
}
