resource "aws_guardduty_detector" "secured" {
  enable = true  # GuardDuty is enabled
}
