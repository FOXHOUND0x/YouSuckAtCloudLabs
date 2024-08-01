resource "aws_dax_cluster" "example" {
  cluster_name = "example-cluster"
  iam_role_arn = aws_iam_role.example.arn
  node_type    = "dax.r4.large"
  replication_factor = 1

  server_side_encryption {
    enabled = true  # Server-side encryption enabled
  }
}
