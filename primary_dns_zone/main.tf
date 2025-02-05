# Please note that this terraform code is for primary DNS zone with automatic SSL certificates. If there is a case, 
# where you would like to use the DNS zones with customer SSL certificates, we can work on the same. 
# The DNS zone will automatically get updated when we onboard new apps to the HTTP LB thats delegated to XC.
# The records get added to "Additional Resource Record Sets" and its encouraged to add more to this section rather than the default "Resource Record Sets"
resource "volterra_dns_zone" "name" {
  name = var.dns_zone_name
  namespace = var.mynamespace
  primary {
    default_soa_parameters = true
    dnssec_mode {
      disable = true
    }
    allow_http_lb_managed_records = true
  }
}