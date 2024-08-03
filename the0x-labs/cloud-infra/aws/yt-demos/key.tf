resource "tls_private_key" "the0xGeneratedKey" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
    key_name   = "the0x"
    public_key = tls_private_key.the0xGeneratedKey.public_key_openssh

    provisioner "local-exec" {
        command = <<-EOF
            echo "${tls_private_key.the0xGeneratedKey.private_key_pem}" > ~/.ssh/the0x.pem
            chmod 400 ~/.ssh/the0x.pem
        EOF
    }
}