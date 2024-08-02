output "private_key" {
    value     = tls_private_key.the0xGeneratedKey.private_key_pem
    sensitive = true
}

output "public_key" {
    value = tls_private_key.the0xGeneratedKey.public_key_openssh
}