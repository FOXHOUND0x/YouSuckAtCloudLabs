resource "aws_config_configuration_recorder" "example" {
  name = "example-recorder"
  role_arn = "value"

  recording_group {
    all_supported = false  # AWS Config not enabled for all regions
    include_global_resource_types = true
  }
}
