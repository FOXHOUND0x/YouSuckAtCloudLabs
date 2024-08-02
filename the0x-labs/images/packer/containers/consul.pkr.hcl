packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "consul" {
  image  = "hashicorp/consul:latest"
  commit = true
}

build {
  sources = ["source.docker.consul"]

  post-processors {

    post-processor "docker-tag" {
      repository = "ghcr.io/the0xsec/consul"
      tag        = ["consul/latest"]
    }

    post-processor "docker-push" {}
  }
}
