resource "aws_elasticache_cluster" "secured" {
  cluster_id = "secured-cluster"
  engine     = "redis"  # Redis engine specified
  engine_version = "4.0.10"  # Compliant version
  node_type  = "cache.t2.micro"
  num_cache_nodes = 1
}
