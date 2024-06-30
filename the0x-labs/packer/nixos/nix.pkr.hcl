packer {
    required_plugins {
        docker = {
            version = ">= 0.0.7"
            source = "github.com/hashicorp/docker"
        }
    }
}

source "docker" "nixos" {
    image = "nixos/nix"
    commit = true
}

build {
    name    = "custom-nixos"
    sources = [
        "source.docker.nixos"
    ]

    provisioner "shell" {
        inline = [
            "nix-channel --add https://nixos.org/channels/nixos-stable nixos",
            "nix-channel --update",
            "nix-env -iA nixos.git",
        ]
    }

    post-processors {
        post-processor "docker-tag" {
            repository = "ephemeralcodex/test"
            tag = ["nixos"]
            force = true
        }
        post-processor "docker-push" {}
    }
}