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
  description = "Name of the Storage Account"
  nullable    = false
}

variable "account_tier" {
  type        = string
  description = "Storage Account account_tier"
  nullable    = false
}

variable "account_replication_type" {
  type        = string
  description = "Storage account account_replication_type"
  nullable    = false
}
