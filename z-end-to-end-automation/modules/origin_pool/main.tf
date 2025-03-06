resource "volterra_origin_pool" "e2e-origipool" {
  name = var.origin_pool_name_insidemodule
  namespace = var.mynamespace_insidemodule
  origin_servers {
    public_ip {
      ip = var.originip_insidemodule
    }
  }
  port = "443"
  health_check_port = "443"
  loadbalancer_algorithm = "LB_OVERRIDE"
  endpoint_selection = "LOCAL_PREFERRED"
  healthcheck {
    name = var.this_is_hc
    namespace = var.this_is_hc_namespace
  }
  no_tls = true
}