resource "aws_docdb_cluster" "secured" {
  cluster_identifier = "secured-cluster"
  engine            = "docdb"
  master_username    = "admin"
  master_password    = "password"
  
  storage_encrypted = true  # Encryption is enabled
}
