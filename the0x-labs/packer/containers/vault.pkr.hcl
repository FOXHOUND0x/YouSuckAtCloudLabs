packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "vault" {
  image  = "hashicorp/vault:latest"
  commit = true
}

build {
  sources = ["source.docker.vault"]

  post-processors {

    post-processor "docker-tag" {
      repository = "unit34/nexus34"
      tag        = ["vault"]
    }

    post-processor "docker-push" {}
  }
}
