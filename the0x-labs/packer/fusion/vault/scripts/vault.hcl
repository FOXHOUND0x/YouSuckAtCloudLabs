log_level = "info"

listner "tcp" {
    address = "0.0.0.0:8200"
    tls_disable = 1
}

storage "file" {
    path = "/opt/vault/data"
}

ui = true
disable_mlock = true