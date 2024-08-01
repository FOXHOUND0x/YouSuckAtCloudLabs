resource "aws_docdb_cluster" "example" {
  cluster_identifier = "example-cluster"
  engine            = "docdb"
  master_username    = "admin"
  master_password    = "password"

  enabled_cloudwatch_logs_exports = null  # Log exports not enabled
}
