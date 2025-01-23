resource "volterra_service_policy" "e2e-servicepolicy" {
  name      = var.servicepolicyname_insidemodule
  namespace = var.mynamespace_insidemodule
  algo      = "FIRST_MATCH"
  any_server = true
  allow_list {
    prefix_list {
      prefixes      = ["1.2.3.4/24"]
      ipv6_prefixes = []
    }
    ip_prefix_set {
      name      = var.this_is_prefixset
      namespace = var.this_is_ip_prefix_set_namespace
    }
    asn_list {
      as_numbers = [713, 7932, 847325, 4683, 15269, 1000001]
    }
    country_list            = ["COUNTRY_US", "COUNTRY_GB"]
    tls_fingerprint_classes = ["GOOTKIT"]
    tls_fingerprint_values  = ["1aa7bf8b97e540ca5edd75f7b8384bfa"]
    default_action_allow    = true
  }
}