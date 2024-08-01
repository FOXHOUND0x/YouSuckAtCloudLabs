resource "aws_elasticache_cluster" "example" {
  cluster_id = "example-cluster"
  engine     = "memcached"  # Memcached engine is specified
  node_type  = "cache.t2.micro"
  num_cache_nodes = 1
}
