resource "volterra_healthcheck" "e2e-hc" {
  name = var.health_check_name_insidemodule
  namespace = var.mynamespace_insidemodule
  http_health_check {
    host_header = "www.ex.com"
    path = "/healthcheck"
    use_http2 = false
    expected_status_codes = ["200"]
  }
  timeout = "3"
  interval = "15"
  unhealthy_threshold = "1"
  healthy_threshold = "3"
}