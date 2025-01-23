resource "volterra_user_identification" "e2e-userident" {
    name = var.useridentname_insidemodule
    namespace = var.mynamespace_insidemodule
    rules {
      ip_and_ja4_tls_fingerprint = true
    }
    rules {
      client_ip = true
    }
}