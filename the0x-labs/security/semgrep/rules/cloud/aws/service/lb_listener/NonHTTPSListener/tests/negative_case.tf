resource "aws_lb_listener" "secured" {
  load_balancer_arn = aws_lb.secured.arn
  port              = 443  # Listener configured on HTTPS
  protocol          = "HTTPS"  # Listener using HTTPS

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.secured.arn
  }
}
