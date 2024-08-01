resource "aws_elasticache_cluster" "example" {
  cluster_id = "example-cluster"
  engine     = "redis"
  node_type  = "cache.t2.micro"
  num_cache_nodes = 1  # Single node configuration
  az_mode = "cross-az"  # Single AZ configuration
}
