variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "location" {
  type        = string
  description = "(Optional) The location for resource deployment"
  default     = "westeurope"
}

variable "tags" {
  type = map(any)
  default = {
    Owner = "Infrastructure Team"
  }
}

variable "environment" {
  type    = string
  default = "production"
}

variable "workload" {
  type    = string
  default = "ephimeral"
}

variable "resource_name_sequence_start" {
  type        = number
  description = "The number to use for the resource names"
  default     = 001
  validation {
    condition     = var.resource_name_sequence_start >= 1 && var.resource_name_sequence_start <= 999
    error_message = "The number must be between 1 and 999"
  }
}

variable "enable_telemetry" {
  type        = bool
  default     = false
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see <https://aka.ms/avm/telemetryinfo>.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}

variable "shared_key" {
  type        = string
  description = "The shared key for the VPN connection"
  sensitive   = true
}
