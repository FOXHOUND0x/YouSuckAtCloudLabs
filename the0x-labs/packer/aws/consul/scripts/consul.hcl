datacenter = "the0x"
data_dir = "/opt/consul/data"
log_level = "INFO"
node_name = "consul-0"
server = true
bootstrap_expect = 3
retry_join = ["provider=aws tag_key=Name tag_value=consul-server"]
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"
ui = true

acl {
    enabled = true
    default_policy = "deny"
    down_policy = "extend-cache"
}

ports {
  dns      = 8600
  http     = 8500
  https    = -1
  rpc      = 8400
  serf_lan = 8301
  serf_wan = 8302
  server   = 8300
}