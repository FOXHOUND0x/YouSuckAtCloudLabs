ui = true

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1  # kill me if this is in production
}

storage "file" {
  path = "/opt/vault/data"
}

api_addr = "http://0.0.0.0:8200"

default_lease_ttl = "168h"
max_lease_ttl     = "720h"
