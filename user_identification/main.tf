resource "volterra_user_identification" "wagh-user-identification" {
    name = var.useridentification
    namespace = var.mynamespace
    rules {
      ip_and_ja4_tls_fingerprint = true
    }
    rules {
      client_ip = true
    }
    # There are a number of options in the drop down, please select the desired option
}