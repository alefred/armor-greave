# This is the module call
module "efficient_address_prefixes_ordered" {
  source  = "Azure/avm-utl-network-ip-addresses/azurerm"
  version = "0.1.0"

  address_space    = var.address_space
  address_prefixes = var.address_prefixes_ordered

  enable_telemetry = var.enable_telemetry
}

module "inefficient_address_prefixes_ordered" {
  source  = "Azure/avm-utl-network-ip-addresses/azurerm"
  version = "0.1.0"

  address_space                 = var.address_space
  address_prefixes              = var.address_prefixes_ordered
  address_prefix_efficient_mode = false

  enable_telemetry = var.enable_telemetry
}

module "efficient_address_prefixes_unordered" {
  source  = "Azure/avm-utl-network-ip-addresses/azurerm"
  version = "0.1.0"

  address_space    = var.address_space
  address_prefixes = var.address_prefixes_unordered

  enable_telemetry = var.enable_telemetry
}

module "inefficient_address_prefixes_unordered" {
  source  = "Azure/avm-utl-network-ip-addresses/azurerm"
  version = "0.1.0"

  address_space                 = var.address_space
  address_prefixes              = var.address_prefixes_unordered
  address_prefix_efficient_mode = false

  enable_telemetry = var.enable_telemetry
}

output "efficient_address_prefixes_ordered" {
  value = module.efficient_address_prefixes_ordered.address_prefixes
}

output "inefficient_address_prefixes_ordered" {
  value = module.inefficient_address_prefixes_ordered.address_prefixes
}

output "efficient_address_prefixes_unordered" {
  value = module.efficient_address_prefixes_unordered.address_prefixes
}

output "inefficient_address_prefixes_unordered" {
  value = module.inefficient_address_prefixes_unordered.address_prefixes
}

output "efficient_address_prefixes_ordered_with_details" {
  value = module.efficient_address_prefixes_ordered.address_prefixes_with_details
}

output "inefficient_address_prefixes_ordered_with_details" {
  value = module.inefficient_address_prefixes_ordered.address_prefixes_with_details
}

output "efficient_address_prefixes_unordered_with_details" {
  value = module.efficient_address_prefixes_unordered.address_prefixes_with_details
}

output "inefficient_address_prefixes_unordered_with_details" {
  value = module.inefficient_address_prefixes_unordered.address_prefixes_with_details
}