resource "aws_config_config_rule" "encrypted_volumes_rule" {
  name = "encrypted-volumes-rule"
  source {
    owner = "AWS"
    source_identifier = "ENCRYPTED_VOLUMES"  # Config rule for encrypted volumes is enabled
  }
}
