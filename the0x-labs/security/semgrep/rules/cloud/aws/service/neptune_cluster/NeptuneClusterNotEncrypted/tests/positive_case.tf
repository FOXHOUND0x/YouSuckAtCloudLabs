resource "aws_neptune_cluster" "example" {
  cluster_identifier = "example-cluster"
  engine            = "neptune"
  
  storage_encrypted = false  # Neptune cluster is not encrypted
}
