variable "location" {
  type    = string
  default = "polandcentral"
}

variable "resource_group_name" {
  type    = string
  default = "sdx-rg"
}

variable "vnet_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "admin_username" {
  type    = string
  default = "sdxuser"
}

variable "ssh_public_key" {
  type        = string
  description = "OpenSSH public key"
}
