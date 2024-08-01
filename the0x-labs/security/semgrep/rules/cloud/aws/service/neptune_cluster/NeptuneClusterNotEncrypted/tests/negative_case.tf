resource "aws_neptune_cluster" "example" {
  cluster_identifier = "example-cluster"
  engine            = "neptune"
  
  storage_encrypted = true  # Neptune cluster is not encrypted
}
