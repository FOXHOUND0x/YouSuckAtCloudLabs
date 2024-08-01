resource "aws_docdb_cluster" "secured" {
  cluster_identifier = "secured-cluster"
  engine            = "docdb"
  master_username    = "admin"
  master_password    = "password"

  enabled_cloudwatch_logs_exports = ["audit", "profiler"]  # Log exports enabled
}
