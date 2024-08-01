resource "aws_redshift_cluster" "secured" {
  cluster_identifier = "secured-cluster"
  node_type         = "dc2.large"
  master_username    = "admin"
  master_password    = "password"
  cluster_type      = "single-node"
}

resource "aws_redshift_logging" "example" {
  cluster_identifier = aws_redshift_cluster.secured.cluster_identifier
  bucket_name        = "example-bucket"
  s3_key_prefix      = "example-prefix"
}
