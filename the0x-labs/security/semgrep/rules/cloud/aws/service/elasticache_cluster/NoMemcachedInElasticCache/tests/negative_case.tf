resource "aws_elasticache_cluster" "secured" {
  cluster_id = "secured-cluster"
  engine     = "redis"  # Redis engine is specified
  node_type  = "cache.t2.micro"
  num_cache_nodes = 1
}
