resource "volterra_ip_prefix_set" "e2e-prefixsets" {
  name = var.prefixsetname_insidemodule
  namespace = var.mynamespace_insidemodule
  ipv4_prefixes {
    ipv4_prefix = "1.2.3.4/24"
    description = "ips with know bad reputation history"
  }
  ipv4_prefixes {
    ipv4_prefix = "1.2.3.5/24"
    description = "ips responsible for latest attacks"
  }
}