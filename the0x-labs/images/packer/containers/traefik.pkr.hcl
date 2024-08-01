packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "traefik" {
  image  = "traefik"
  commit = true
}

build {
  sources = ["source.docker.traefik"]

  post-processors {

    post-processor "docker-tag" {
      repository = "unit34/nexus34"
      tag        = ["traefik"]
    }

    post-processor "docker-push" {}
  }
}
