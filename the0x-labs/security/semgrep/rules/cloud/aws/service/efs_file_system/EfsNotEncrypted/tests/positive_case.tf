resource "aws_efs_file_system" "example" {
  creation_token = "example-efs"
  
  encrypted = false  # EFS encryption is disabled
}
