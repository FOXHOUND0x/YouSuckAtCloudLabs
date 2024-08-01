resource "aws_efs_file_system" "secured" {
  creation_token = "secured-efs"
  
  encrypted = true  # EFS encryption is enabled
}
