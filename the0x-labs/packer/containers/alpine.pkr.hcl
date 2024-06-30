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
      repository = "unit34/nexus34"
      tag        = ["alpine"]
    }

    post-processor "docker-push" {}
  }
}
