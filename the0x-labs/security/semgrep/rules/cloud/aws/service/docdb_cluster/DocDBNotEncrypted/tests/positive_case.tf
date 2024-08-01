resource "aws_docdb_cluster" "example" {
  cluster_identifier = "example-cluster"
  engine            = "docdb"
  master_username    = "admin"
  master_password    = "password"

  storage_encrypted = false  # Encryption is disabled
}
