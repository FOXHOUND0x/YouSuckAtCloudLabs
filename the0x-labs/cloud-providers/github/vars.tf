variable "GITHUB_TOKEN" {}

variable "prod" {
  type = bool
  default = false
}

variable "pre-prod" {
  type = bool
  default = false
}

variable "dev" {
  type = bool
  default = true
}

