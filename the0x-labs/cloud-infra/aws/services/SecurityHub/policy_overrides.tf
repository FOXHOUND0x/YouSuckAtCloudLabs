resource "aws_securityhub_configuration_policy" "securityhub_policy" {
  name        = "configuration-policy"
  description = "Fanatics SecurityHub Configuration Policy"

  configuration_policy {
    service_enabled = true
    enabled_standard_arns = [
      "arn:aws:securityhub:us-east-1::standards/aws-foundational-security-best-practices/v/1.0.0",
    ]
    security_controls_configuration {
      disabled_control_identifiers = [
        "EC2.3"
      ]
    }
  }
}

resource "aws_securityhub_configuration_policy_association" "root" {
  target_id = "r-slmg"
  policy_id = aws_securityhub_configuration_policy.securityhub_policy.id
}