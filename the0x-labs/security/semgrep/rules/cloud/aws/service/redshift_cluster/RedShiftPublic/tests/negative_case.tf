resource "aws_redshift_cluster" "secured" {
  cluster_identifier = "secured-cluster"
  node_type         = "dc2.large"
  master_username    = "admin"
  master_password    = "password"
  cluster_type      = "single-node"

  publicly_accessible = false  # Redshift cluster is not publicly accessible
}
