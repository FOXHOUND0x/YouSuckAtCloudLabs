resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.example.arn
  port              = 80  # Listener configured on HTTP
  protocol          = "HTTP"  # Listener using HTTP

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.example.arn
  }
}
