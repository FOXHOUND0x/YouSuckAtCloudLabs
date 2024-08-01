resource "aws_ecr_repository" "secured" {
  name = "secured-repo"

  image_scanning_configuration {
    scan_on_push = true  # Scanning is enabled on push
  }
}
