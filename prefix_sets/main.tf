resource "volterra_ip_prefix_set" "name" {
  name = var.prefixsetname
  namespace = var.mynamespace
  ipv4_prefixes {
    ipv4_prefix = "1.2.3.4/24"
    description = "ips with know bad reputation history"
  }
  ipv4_prefixes {
    ipv4_prefix = "1.2.3.5/24"
    description = "ips with know bad reputation history"
  }
  ipv6_prefixes {
    ipv6_prefix = "2001:db8::/32"
    description = "ips with know bad reputation history"
  }
}