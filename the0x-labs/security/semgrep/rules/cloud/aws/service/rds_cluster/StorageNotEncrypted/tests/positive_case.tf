resource "aws_athena_database" "example" {
  name = "example_database"
  # Missing encryption_configuration block
}
