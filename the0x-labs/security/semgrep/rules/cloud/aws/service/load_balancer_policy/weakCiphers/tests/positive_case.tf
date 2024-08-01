resource "aws_load_balancer_policy" "example" {
  policy_name = "example-policy"
  
  security_policy = [
    "Protocol-SSLv3",  # Insecure cipher specified
    "Protocol-TLSv1"
  ]
}
