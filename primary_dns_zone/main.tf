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