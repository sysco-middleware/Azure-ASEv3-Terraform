variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "name" {
  description = "ASE name"
  type        = string
}

variable "subnet_id" {
  description = "subnet_id"
  type        = string
}


variable "tags" {
  type = map(string)
  default = {
    ENV = "test"
  }
  description = "The tags to associate with your network and subnets."
}

