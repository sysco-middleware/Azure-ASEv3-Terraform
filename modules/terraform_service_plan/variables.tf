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
  description = "Name of the App Service Plan"
  nullable    = false
}

variable "os_type" {
  type        = string
  description = "OS Type of ASP"
  nullable    = false
}

variable "sku_name" {
  type        = string
  description = "SKU of ASP"
  nullable    = false
}

variable "app_service_environment_id" {
  type        = string
  description = "ID of the ASE"
  nullable    = false
}
