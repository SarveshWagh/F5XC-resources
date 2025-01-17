resource "volterra_service_policy" "volt-service-policy" {
  name      = var.servicepolicyname
  namespace = var.mynamespace
  algo      = "FIRST_MATCH"

  # Which server would you like the service policy be applied to, you can choose from the four options below
  
  #Any application name
  any_server = true #1
  
  #Specific application name
    # server_name = "www.example.com" #2
  
  #Using setof application domain names
  #   server_name_matcher { #3
  #     exact_values = [ "www.example.com", "support.ex.com" ]
  #   }
  
  # Using labels
  #   server_selector { #4
  #     expressions = [ "run in (test-nginx)" ]
  #   }

# Use one of the 5 options below to create the service policy

  allow_list { #1
    prefix_list {
      prefixes      = ["1.2.3.4/24"]
      ipv6_prefixes = []
    }
    ip_prefix_set {
      name      = "shali-test-prefix-set-1"
      namespace = "shared"
    }
    asn_list {
      as_numbers = [713, 7932, 847325, 4683, 15269, 1000001]
    }
    country_list            = ["COUNTRY_US", "COUNTRY_GB"]
    tls_fingerprint_classes = ["GOOTKIT"]
    tls_fingerprint_values  = ["1aa7bf8b97e540ca5edd75f7b8384bfa"]
    default_action_allow    = true
  }

#   deny_list { #2
#     prefix_list {
#       prefixes      = ["1.2.3.4/24"]
#       ipv6_prefixes = []
#     }
#     ip_prefix_set {
#       name      = "shali-test-prefix-set-1"
#       namespace = "shared"
#     }
#     asn_list {
#       as_numbers = [713, 7932, 847325, 4683, 15269, 1000001]
#     }
#     country_list            = ["COUNTRY_US", "COUNTRY_GB"]
#     tls_fingerprint_classes = ["GOOTKIT"]
#     tls_fingerprint_values  = ["1aa7bf8b97e540ca5edd75f7b8384bfa"]
#     default_action_allow    = true
#   }

#   allow_all_requests = true #3

#   deny_all_requests  = true #4

#   Custom Rule list, this can be altered as required
    # rule_list { #5
    #   rules {
    #     metadata {
          
    #     }
    #     spec {
          
    #     }
    #   }
    # }
}