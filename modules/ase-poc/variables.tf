variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "norwayeast"
}

variable "service_prefix" {
  type        = string
  description = "prefix for all reources"
}

# Networking

variable "custom_vnet_map" {
  description = "vnets to be created"
  type = map(object({
    vnet_address_space = list(string)
    subnet_names       = list(string)
    subnet_prefixes    = list(string)
  }))
  # default = {
  #   "dmz" = {
  #     vnet_address_space = ["10.1.0.0/16"] # VCN CIDR range
  #     subnet_names       = ["gateway"]     # Names of subnets 
  #     subnet_prefixes    = ["10.1.1.0/24"] # Subnet CIDR Ranges for the subnets in subnet_names
  #   }
  #   "ase" = {
  #     vnet_address_space = ["10.2.0.0/16"] # VCN CIDR range
  #     subnet_names       = ["backend"]     # Names of subnets
  #     subnet_prefixes    = ["10.2.1.0/24"] # Subnet CIDR Ranges for the subnets in subnet_names
  #   }
  # }
}

variable "vnet_location" {
  description = "location of virtual network"
  type        = string
}

variable "virtual_network_name" {
  description = "name for virtual network"
  type        = string
}
# variable "vnet_address_space" {
#   description = "names for virtual network"
#   type        = list(string)
# }

# # variable "dns_servers" {
# #   description = "If applicable, a list of custom DNS servers to use inside your virtual network.  Unset will use default Azure-provided resolver"
# #   type        = list(string)
# #   default     = null
# # }


# variable "subnet_names" {
#   type        = list(string)
#   description = "subnet_names"
# }

# variable "subnet_prefixes" {
#   type        = list(string)
#   description = "subnet_prefixes"
# }

variable "subnet_delegation" {
  type        = map(map(any))
  default     = {}
  description = "A map of subnet name to delegation block on the subnet"
}

# variable "use_for_each" {
#   type    = bool
#   default = true
# }

# variable "tags" {
#   type = map(string)
#   default = {
#     ENV = "test"
#   }
#   description = "The tags to associate with your network and subnets."
# }

variable "ase_subnet" {
  type        = string
  description = "ase_subnet"
  # default     = "ase_subnet"
  nullable = false
}

variable "ase_vnet" {
  type        = string
  description = "ase_subnet"
  # default     = "ase"
  nullable = false
}

variable "enable_peering" {
  type        = bool
  description = "enable_peering"
  nullable    = true
  default = false
}


variable "remote_virtual_network_name" {
  type        = string
  description = "remote_virtual_network_name"
  nullable    = true
}

variable "peering_name" {
  type        = string
  description = "peering_name"
  nullable    = true
}
# variable "virtual_network_name" {
#   type        = string
#   description = "virtual_network_name"
#   nullable    = true
# }


# variable "custom_vnet_peering_map" {
#   description = "vnets to be created"
#   type = map(object({
#     virtual_network_name        = string
#     remote_virtual_network_name = string
#   }))
#   # default = {
#   # {
#   #   "ase_peering" = {
#   #     virtual_network_name = "ase"
#   #     remote_virtual_network_name       = "dmz"
#   #   }
#   #   "dmz_peering" = {
#   #     virtual_network_name = "dmz"
#   #     remote_virtual_network_name       = "ase"
#   #   }
#   # }
# }
