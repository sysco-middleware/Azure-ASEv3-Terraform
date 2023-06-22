variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "norwayeast"
}

variable "name" {
  description = "Logic App name"
  type        = string
}

variable "app_service_plan_id" {
  description = "app_service_plan_id"
  type        = string
}

variable "storage_account_name" {
  description = "storage_account_name"
  type        = string
}

variable "storage_account_access_key" {
  description = "storage_account_access_key"
  type        = string
}

variable "app_settings" {
  description = "app_settings"
  type        = map(string)
}
