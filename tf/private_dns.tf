
resource "azurerm_private_dns_zone" "azhop_private_dns" {
  name                = "hpc.azure"
  resource_group_name = local.create_rg ? azurerm_resource_group.rg[0].name : data.azurerm_resource_group.rg[0].name
}

resource "azurerm_private_dns_zone_virtual_network_link" "azhop_dns_link" {
  name                  = "az-hop"
  resource_group_name   = azurerm_private_dns_zone.azhop_private_dns.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.azhop_private_dns.name
  virtual_network_id    = local.create_vnet ? azurerm_virtual_network.azhop[0].id : data.azurerm_virtual_network.azhop[0].id
  registration_enabled  = true
}

 resource "azurerm_private_dns_srv_record" "ldap_tcp" {
   name                = "_ldap._tcp"
   resource_group_name = azurerm_resource_group.rg[0].name
   zone_name           = azurerm_private_dns_zone.azhop_private_dns.name
   ttl                 = 3600
   record {
     priority = 1
     weight   = 100
     port     = 389
     target   = "ad.hpc.azure."
   }
 }
 resource "azurerm_private_dns_srv_record" "ldap_tcppdc_msdcs" {
   name                = "_ldap._tcp.pdc._msdcs"
   resource_group_name = azurerm_resource_group.rg[0].name
   zone_name           = azurerm_private_dns_zone.azhop_private_dns.name
   ttl                 = 3600
   record {
     priority = 1
     weight   = 100
     port     = 389
     target   = "ad.hpc.azure."
   }
 }
 resource "azurerm_private_dns_srv_record" "ldap_tcpdc_msdcs" {
   name                = "_ldap._tcp.dc._msdcs"
   resource_group_name = azurerm_resource_group.rg[0].name
   zone_name           = azurerm_private_dns_zone.azhop_private_dns.name
   ttl                 = 3600
   record {
     priority = 1
     weight   = 100
     port     = 389
     target   = "ad.hpc.azure."
   }
 }
 resource "azurerm_private_dns_srv_record" "ldapdefault-first-site-name_sitesdc_msdcs" {
   name                = "_ldap.default-first-site-name._sites.dc._msdcs"
   resource_group_name = azurerm_resource_group.rg[0].name
   zone_name           = azurerm_private_dns_zone.azhop_private_dns.name
   ttl                 = 3600
   record {
     priority = 1
     weight   = 100
     port     = 389
     target   = "ad.hpc.azure."
   }
 }
 resource "azurerm_private_dns_srv_record" "ldapgc_msdcs" {
   name                = "_ldap.gc._msdcs"
   resource_group_name = azurerm_resource_group.rg[0].name
   zone_name           = azurerm_private_dns_zone.azhop_private_dns.name
   ttl                 = 3600
   record {
     priority = 1
     weight   = 100
     port     = 3268 
     target   = "ad.hpc.azure."
   }
 }
 resource "azurerm_private_dns_srv_record" "ldapdefault-first-site-name_sitesgc_msdcs" {
   name                = "_ldap.default-first-site-name._sites.gc._msdcs"
   resource_group_name = azurerm_resource_group.rg[0].name
   zone_name           = azurerm_private_dns_zone.azhop_private_dns.name
   ttl                 = 3600
   record {
     priority = 1
     weight   = 100
     port     = 3268 
     target   = "ad.hpc.azure."
   }
 }
 resource "azurerm_private_dns_srv_record" "kerberos_udp" {
   name                = "_kerberos._udp"
   resource_group_name = azurerm_resource_group.rg[0].name
   zone_name           = azurerm_private_dns_zone.azhop_private_dns.name
   ttl                 = 3600
   record {
     priority = 1
     weight   = 100
     port     = 88
     target   = "ad.hpc.azure."
   }
 }
 resource "azurerm_private_dns_srv_record" "kerberos_tcp" {
   name                = "_kerberos._tcp"
   resource_group_name = azurerm_resource_group.rg[0].name
   zone_name           = azurerm_private_dns_zone.azhop_private_dns.name
   ttl                 = 3600
   record {
     priority = 1
     weight   = 100
     port     = 88
     target   = "ad.hpc.azure."
   }
 }
 resource "azurerm_private_dns_srv_record" "kerberos_tcpdc_msdcs" {
   name                = "_kerberos._tcp.dc._msdcs"
   resource_group_name = azurerm_resource_group.rg[0].name
   zone_name           = azurerm_private_dns_zone.azhop_private_dns.name
   ttl                 = 3600
   record {
     priority = 1
     weight   = 100
     port     = 88
     target   = "ad.hpc.azure."
   }
 }
 resource "azurerm_private_dns_srv_record" "kerberosdefault-first-site-name_sitesdc_msdcs" {
   name                = "_kerberos.default-first-site-name._sites.dc._msdcs"
   resource_group_name = azurerm_resource_group.rg[0].name
   zone_name           = azurerm_private_dns_zone.azhop_private_dns.name
   ttl                 = 3600
   record {
     priority = 1
     weight   = 100
     port     = 88
     target   = "ad.hpc.azure."
   }
 }
 resource "azurerm_private_dns_srv_record" "kpasswd_udp" {
   name                = "_kpasswd._udp"
   resource_group_name = azurerm_resource_group.rg[0].name
   zone_name           = azurerm_private_dns_zone.azhop_private_dns.name
   ttl                 = 3600
   record {
     priority = 1
     weight   = 100
     port     = 464
     target   = "ad.hpc.azure."
   }
 }
