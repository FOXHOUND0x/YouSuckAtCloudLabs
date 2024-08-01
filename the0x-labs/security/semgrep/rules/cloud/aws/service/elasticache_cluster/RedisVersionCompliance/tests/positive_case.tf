resource "aws_elasticache_cluster" "example" {
  cluster_id = "example-cluster"
  engine     = "redis"  # Redis engine specified
  engine_version = "2.8.24"  # Not compliant with PCI DSS requirements
  node_type  = "cache.t2.micro"
  num_cache_nodes = 1
}
