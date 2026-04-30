variable "project" {
  default = "project2"
}

variable "group" {
  default = "g6"
}

variable "location" {
  default = "uaenorth"
}

variable "admin_source_cidr" {
  default = "0.0.0.0/0"
}

locals {
  suffix = "${var.project}-${var.group}"
}

variable "admin_ssh_public_key" {}

variable "sql_admin_password" {
  sensitive = true
}

variable "sonar_db_password" {
  sensitive = true
}
