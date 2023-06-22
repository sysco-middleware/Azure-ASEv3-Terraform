variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
  nullable    = false
}

# variable "enable_peering" {
#   type        = bool
#   description = "enable_peering"
#   nullable    = false
# }
variable "peering_name" {
  type        = string
  description = "peering_name"
  nullable    = true
}
variable "virtual_network_name" {
  type        = string
  description = "virtual_network_name"
  nullable    = true
}
variable "remote_virtual_network_id" {
  type        = string
  description = "remote_virtual_network_id"
  nullable    = true
}
