resource "aws_redshift_cluster" "example" {
  cluster_identifier = "example-cluster"
  node_type         = "dc2.large"
  master_username    = "admin"
  master_password    = "password"
  cluster_type      = "single-node"

  publicly_accessible = true  # Redshift cluster is publicly accessible
}
