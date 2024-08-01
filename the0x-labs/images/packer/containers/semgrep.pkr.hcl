packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "semgrep" {
  image  = "semgrep/semgrep"
  commit = true
}

build {
  sources = ["source.docker.semgrep"]

  post-processors {

    post-processor "docker-tag" {
      repository = "unit34/nexus34"
      tag        = ["semgrep"]
    }

    post-processor "docker-push" {}
  }
}
