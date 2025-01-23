resource "volterra_origin_pool" "name" {
  name = var.origin_pool_name
  namespace = var.mynamespace
  origin_servers {
    public_ip {
      ip = "1.2.3.4"
    }
  }
  port = "443"
  health_check_port = "443"
  loadbalancer_algorithm = "LB_OVERRIDE"
  endpoint_selection = "LOCAL_PREFERRED"
  healthcheck {
    name = "ross-hc"
    namespace = var.mynamespace
  }
#   no_tls = true
  use_tls {
    use_host_header_as_sni = true 
    tls_config {
      default_security = true
    }
    volterra_trusted_ca = true
    no_mtls = true
    default_session_key_caching = true
  }
}