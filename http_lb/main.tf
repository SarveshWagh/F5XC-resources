resource "volterra_http_loadbalancer" "sample-lb" {
  name        = var.lbname
  description = var.mydescription
  namespace   = var.mynamespace
  domains = [ "www.example.com", "support.example.com", "you.ex.com" ] #Add your application domain names here, this can be FQDN or wildcard
  
  #If you would like to set up the HTTP LB using F5XC minted certificates you can use the option below
  https_auto_cert {
    http_redirect = var.http_redirect
    add_hsts = var.add_hsts
    no_mtls  = var.no_mtls
    port = 443
    tls_config {
        default_security = true
    }
    http_protocol_options {
        http_protocol_enable_v1_v2 = true
    }
  }

  #Since you have multiple origins in Germany and Sweden. 
  #I have setup two routes here, each forwarding the traffic to different origin based on the incoming path. We can choose other options for routing the gtraffic too like, eg: regex, incoming host header, port match

  #Sample 1st route
  routes {
    #an example of adding a 'Simple route'
    simple_route {
        http_method = "Any"
        path {
          prefix = "/abc/xyz"
        }
        origin_pools {
          pool {
            name = var.poolname1
            namespace = var.mynamespace
          }
          weight = 1
          priority = 1
        }
        #an example of how to add multiple origin pools
        origin_pools {
          pool {
            name = var.poolname2
            namespace = var.mynamespace
          }
          weight = 1
          priority = 0
        }
    }
  }
  
  #Sample 2nd route
  routes {
    #an example of adding a 'Simple route'
    simple_route {
        http_method = "Any"
        path {
          prefix = "/def/lmn"
        }
        headers {
          name = "host"
          exact = "www.testsportsdirect.com"
        }
        origin_pools {
          pool {
            name = var.poolname3
            namespace = var.mynamespace
          }
          weight = 1
          priority = 1
        }
        #auto_host_rewrite = true
        disable_host_rewrite = true
        query_params {
          #retain_all_params = true
          remove_all_params = true
        }
        advanced_options {
            app_firewall {
              name = var.appfirewallname2
              namespace = var.mynamespace
            }
        }
    }
  }

  app_firewall {
    name = var.appfirewallname1
    namespace = var.mynamespace
  }

# Service policies
# Use one of the three options below to setup the service policies

# no_service_policies = true #1

# Apply specified Service policy
  active_service_policies { #2
    policies {
      namespace = "shared"
      name = "shali-sp-shared"
    }
    policies {
      namespace = "wagh"
      name = "sar-allowed-ip-list"
    }
  }

  # service_policies_from_namespace = true #3

#User identification
#Use one of the two options below to setup the user identification
  user_id_client_ip = true #1
  # user_identification { #2
  #   name = "sar-useridentification"
  #   namespace = var.mynamespace
  # }

  enable_malicious_user_detection = true
  # disable_malicious_user_detection = true
  
  #Disable malicious User Mitigation And Challenges
  #no_challenge = true
  
  #Enable malicious User Mitigation And Challenges with default options
  enable_challenge {
    default_mitigation_settings = true
    default_js_challenge_parameters = true
    default_captcha_challenge_parameters = true
  }
  
  #Enable malicious User Mitigation And Challenges with custom mitigation options and default JS and captcha parameters
  # enable_challenge {
  #   malicious_user_mitigation {
  #     name = "test"
  #     namespace = var.mynamespace
  #   }
  #   default_js_challenge_parameters = true
  #   default_captcha_challenge_parameters = true
  # }

  # Enable malicious User Mitigation And Challenges with custom mitigation options and custom JS and captcha parameters
  # enable_challenge {
  #   malicious_user_mitigation {
  #     name = "test"
  #     namespace = var.mynamespace
  #   }
  #   captcha_challenge_parameters {
  #     cookie_expiry = 3600
  #   }
  #   js_challenge_parameters {
  #     js_script_delay = 5000
  #     cookie_expiry = 3600
  #   }
  # }

# JavaScript challenge
  # js_challenge {
  #   js_script_delay = 5000
  #   cookie_expiry = 3600
  # }

  #This is how you would like to advertise the HTTP LB, in this case, we advertise it on the internet, i.e. regional edge [RE]
  advertise_on_public_default_vip = true
}