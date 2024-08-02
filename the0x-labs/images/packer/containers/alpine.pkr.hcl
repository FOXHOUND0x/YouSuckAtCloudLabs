packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "alpine" {
  image  = "alpine"
  commit = true
}

build {
  sources = ["source.docker.alpine"]

  post-processors {
    post-processor "docker-tag" {
      repository = "ghcr.io/the0xsec/alpine"
      tag        = ["alpine/latest", "alpine/1.0.0"]
    }

    post-processor "docker-push" {}
  }
}
