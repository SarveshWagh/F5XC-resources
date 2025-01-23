resource "volterra_http_loadbalancer" "e2e-httplb" {
  name        = var.httplbname_insidemodule
  namespace   = var.mynamespace_insidemodule
  domains = [ "www.sarveshwagh.com" ]

  https_auto_cert {
    http_redirect = var.http_redirect_insidemodule
    add_hsts = var.add_hsts_insidemodule
    no_mtls  = var.no_mtls_insidemodule
    port = var.port_insidemodule
    tls_config {
        default_security = true
    }
    http_protocol_options {
        http_protocol_enable_v1_v2 = true
    }
  }

  routes {
    simple_route {
        http_method = "Any"
        path {
          prefix = "/def/lmn"
        }
        headers {
          name = "host"
          exact = "www.ex.com"
        }
        origin_pools {
          pool {
            name = var.this_is_originpool1
            namespace = var.this_is_originpool1_namespace
          }
          weight = 1
          priority = 1
        }
        disable_host_rewrite = true
        query_params {
          retain_all_params = true
        }
    }
  }

  app_firewall {
    name = var.this_is_fw
    namespace = var.this_is_fw_namespace
  }

  active_service_policies {
    policies {
        name = var.this_is_servicepolicy
        namespace = var.this_is_sp_namespace
    }
  }
  
  user_identification {
    name = var.this_is_userident
    namespace = var.this_is_userident_namespace
  }

  enable_malicious_user_detection = true

# Enable malicious User Mitigation And Challenges with custom mitigation options and custom JS and captcha parameters
  enable_challenge {
    malicious_user_mitigation {
      name = var.this_is_mum
      namespace = var.this_is_mum_namespace
    }

    #captcha parameters
    captcha_challenge_parameters {
      cookie_expiry = 3600
    }

    #custom JS
    js_challenge_parameters {
      js_script_delay = 5000
      cookie_expiry = 3600
    }
  }

# Custom JavaScript challenge
  js_challenge {
    js_script_delay = 5000
    cookie_expiry = 3600
  }

#Advertizing the HTTP LB on the internet, as in RE [regional edge]
  advertise_on_public_default_vip = true

}