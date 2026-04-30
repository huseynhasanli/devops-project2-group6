variable "rg_name" {}
variable "location" {}
variable "suffix" {}
variable "tenant_id" {}
variable "deployer_object_id" {}
variable "secret_reader_principal_ids" {
  type = list(string)
}
variable "sql_admin_password" {
  sensitive = true
}
variable "sonar_db_password" {
  sensitive = true
}
variable "app_insights_connection_string" {
  sensitive = true
}
