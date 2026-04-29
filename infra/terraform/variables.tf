variable "project" {
  default = "project2"
}

variable "group" {
  default = "g6"
}

variable "location" {
  default = "uaenorth"
}

locals {
  suffix = "${var.project}-${var.group}"
}

variable "admin_ssh_public_key" {}