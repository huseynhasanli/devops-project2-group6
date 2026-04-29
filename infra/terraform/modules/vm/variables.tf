variable "rg_name" {}
variable "location" {}
variable "suffix" {}
variable "frontend_subnet_id" {}
variable "backend_subnet_id" {}
variable "ops_subnet_id" {}
variable "vm_size" {
  default = "Standard_D2s_v3"
}
variable "admin_username" {
  default = "azureuser"
}
variable "admin_ssh_public_key" {}