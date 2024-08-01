resource "aws_inspector2_enabler" "alomas_inspector" {
  account_ids    = ["954093664884","578857943126"]
  resource_types = ["EC2", "LAMBDA", "LAMBDA_CODE"]
}