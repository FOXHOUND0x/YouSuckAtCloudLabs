resource "aws_ecr_repository" "example" {
  name = "example-repo"

  image_scanning_configuration {
    scan_on_push = true  # Scanning is enabled
  }

  # No encryption configuration present
}
