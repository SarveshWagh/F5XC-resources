


# HTTP LB settings
http_lb_name = "sarvesh-wagh-http-lb"
add_hsts = true
no_mtls = true
port = "443"
http_redirect = true


# Firewall settings
firewall_name = "sarvesh-wagh-app-firewall"

# Origin pool settings
origin_pool_name = "sarvesh-wagh-origin-pool"
originip = "1.2.3.4"
health_check_name = "sarvesh-wagh-hc"

#DNS settings
dns_zone_name = "test.sarvesh.site"
dns_zone_namespace = "system"

# MUM settings
mum_policy_name = "sarvesh-wagh-mum-policy"

# User identification settings
useridentname = "sarvesh-wagh-userident"

# Service policy settings
servicepolicyname = "sarvesh-wagh-servicepolicy"

# Prefix set settings
prefixsetname = "sarvesh-wagh-prefixset"

mynamespace      = "wagh"
api_p12_file  = "./sdc-support.console.ves.volterra.io.api-creds.p12"
api_url       = "https://sdc-support.console.ves.volterra.io/api"
