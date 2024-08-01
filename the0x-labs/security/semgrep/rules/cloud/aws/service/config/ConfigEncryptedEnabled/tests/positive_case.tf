resource "aws_config_config_rule" "example" {
  name = "example-rule"
  source {
    owner = "AWS"
    source_identifier = "SOME_OTHER_IDENTIFIER"  # Not checking for encrypted volumes
  }
}
