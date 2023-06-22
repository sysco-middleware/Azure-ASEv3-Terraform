variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
  nullable    = false
}

variable "location" {
  type        = string
  description = "Location of the resource group."
  nullable    = false
}

variable "name" {
  type        = string
  description = "Name of the function app"
  nullable    = false
}

variable "storage_account_name" {
  type        = string
  description = "Storage Account name"
  nullable    = false
}

variable "storage_account_access_key" {
  type        = string
  description = "Storage account access key"
  nullable    = false
}

variable "service_plan_id" {
  type        = string
  description = "ASP id"
  nullable    = false
}

