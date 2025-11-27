locals {
  region      = module.regions.regions_by_name_or_display_name[var.location]
  region_name = module.regions.regions_by_name_or_display_name[var.location].name
  region_code = module.regions.regions_by_name_or_display_name[var.location].geo_code

  # Define standard prefixes and segments
  prefixes = {
    resource_group               = "rg"
    virtual_network              = "vnet"
    subnet                       = "snet"
    dns_private_resolver         = "dnspr"
    virtual_network_gateways     = "vng"
    public_ip                    = "pip"
    local_network_gateways       = "lgw"
    vpn_connections              = "vcn"
    network_security_group       = "nsg"
    azure_firewalls              = "afw"
    bastion_hosts                = "bas"
    route                        = "rt"
    firewall_policies            = "afwp"
    nat_gateway                  = "ng"
    key_vault                    = "kv"
    storage_account              = "st"
    virtual_network              = "vnet"
    virtual_network_links        = "vlink"
    log_analytics_workspace_name = "law"
  }

  # Standard name components
  organization = "luis"
  sequence     = format("%03d", var.resource_name_sequence_start)

  # Create consistent name patterns
  name_templates_v2 = {
    for resource_type, prefix in local.prefixes :
    resource_type => contains(["st"], prefix) ?
    "${prefix}${local.organization}${var.environment}${local.region_code}${var.workload}" :
    "${prefix}-${local.organization}-${var.environment}-${local.region_code}-${var.workload}"
  }

  # Add resource group names
  resource_group_names_v2 = ["bastion", "dns", "dnsresolver", "firewall", "monitoring", "network", "route"]

# ######--------------- Automated completely
  resource_abbreviations = tomap({ for k, v in module.naming : k => v.name if can(v.name) })
  custom_abbreviations = {
    other = "lui"
  }
  all_abbreviations = merge(local.resource_abbreviations, local.custom_abbreviations)
  environment       = "dll"
  sufix             = "sufix"
  project           = local.configs.general.short_name
  config_tags       = local.configs.general.tags

  vnet_rg_name = replace(local.name_templates.resource_group, "${local.project}-${local.sufix}", "connectivity")
  vnet_name    = replace(local.name_templates.virtual_network, "${local.project}-${local.sufix}", "connectivity")
  subnet_cidr  = local.configs.general.databricks_configuration.subnet_cidr
  common_tags = {
    Developer   = "LA"
    Application = "MLOPS"
  }
  tags = merge(local.common_tags, try(local.config_tags, {}))

  # Create consistent name patterns
  name_templates = {
    for resource_type, prefix in local.all_abbreviations :
    resource_type => contains(["st"], prefix) ?
    "${prefix}mlops${local.project}${local.sufix}${local.environment}" :
    "${prefix}-mlops-${local.project}-${local.sufix}-${local.environment}"
  }
  resource_group_names = ["network", "data"]
}
