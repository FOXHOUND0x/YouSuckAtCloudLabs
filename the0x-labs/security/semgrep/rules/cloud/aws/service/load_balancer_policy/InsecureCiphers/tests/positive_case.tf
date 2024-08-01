resource "aws_load_balancer_policy" "example" {
  policy_name = "example-policy"
  policy_type_name = "SSLNegotiationPolicyType"
  
  security_policy = [
    "Protocol-SSLv3",  # Insecure protocol specified
    "Protocol-TLSv1"
  ]
}
