variable "name" {
  type        = string
  description = "Globally unique Key Vault name."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "tenant_id" {
  type        = string
  description = "Microsoft Entra tenant ID."
}

variable "virtual_network_id" {
  type        = string
  description = "VNet linked to privatelink.vaultcore.azure.net."
}

variable "ops_subnet_id" {
  type        = string
  description = "Subnet for the ops runner and Key Vault private endpoint."
}

variable "ops_runner_principal_id" {
  type        = string
  description = "Managed identity principal ID of the ops runner VM."
}

variable "sku_name" {
  type    = string
  default = "standard"
}

variable "purge_protection_enabled" {
  type    = bool
  default = true
}

variable "soft_delete_retention_days" {
  type    = number
  default = 7
}

variable "tags" {
  type    = map(string)
  default = {}
}