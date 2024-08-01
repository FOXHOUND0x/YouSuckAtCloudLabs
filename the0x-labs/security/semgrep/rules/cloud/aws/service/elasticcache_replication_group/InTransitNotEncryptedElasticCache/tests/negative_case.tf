resource "aws_elasticache_replication_group" "example" {
  replication_group_id = "example"
  description          = "example with authentication"
  node_type            = "cache.t2.micro"
  num_cache_clusters   = 1
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.example.name
  security_group_ids   = [aws_security_group.example.id]
  parameter_group_name = "default.redis5.0"
  engine_version       = "5.0.6"

  transit_encryption_enabled = true
  auth_token                 = "abcdefgh1234567890"
  auth_token_update_strategy = "ROTATE"
}