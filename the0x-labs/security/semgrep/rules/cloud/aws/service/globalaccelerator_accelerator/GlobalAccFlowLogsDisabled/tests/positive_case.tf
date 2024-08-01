resource "aws_globalaccelerator_accelerator" "example" {
  name = "example-accelerator"

  attributes {
    flow_logs_enabled = false  # Flow logs are disabled
  }
}
