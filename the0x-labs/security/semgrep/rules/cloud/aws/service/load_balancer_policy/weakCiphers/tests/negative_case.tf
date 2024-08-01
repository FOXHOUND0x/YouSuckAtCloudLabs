resource "aws_load_balancer_policy" "secured" {
  policy_name = "secured-policy"
  
  security_policy = [
    "Protocol-TLSv1.2",  # Secure protocols specified
    "Protocol-TLSv1.3"
  ]
}
