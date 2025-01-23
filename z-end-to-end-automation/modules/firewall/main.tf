resource "volterra_app_firewall" "e2e-fw" {
  name        = var.firewall_name_insidemodule
  namespace   = var.mynamespace_insidemodule
  monitoring = true
  default_detection_settings = true
  allow_all_response_codes = true
  default_anonymization = true
  use_default_blocking_page = true
}