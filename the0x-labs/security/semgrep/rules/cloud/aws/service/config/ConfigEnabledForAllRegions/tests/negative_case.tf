resource "aws_config_configuration_recorder" "secured" {
  name = "secured-recorder"
  role_arn = "value"

  recording_group {
    all_supported = true  # AWS Config is enabled for all regions
    include_global_resource_types = true
  }
}
