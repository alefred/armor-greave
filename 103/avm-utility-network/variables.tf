variable "address_space" {
  type        = string
  description = "The address space that is used the virtual network in CIDR notation"
  default     = "10.0.0.0/22"
}

variable "address_prefixes_ordered" {
  type        = map(number)
  description = "The size of the subnets"
  default = {
    "a" = 28
    "b" = 26
    "c" = 26
    "d" = 27
  }
}

variable "address_prefixes_unordered" {
  type        = map(number)
  description = "The size of the subnets"
  default = {
    "d" = 27
    "c" = 26
    "b" = 26
    "a" = 28
  }
}

variable "enable_telemetry" {
  type    = bool
  default = false
}