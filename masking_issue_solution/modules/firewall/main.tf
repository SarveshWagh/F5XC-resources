# Iteration not working true false condition.

# resource "volterra_app_firewall" "test-fw-1" {
#   name        = var.f5xc_waf_name
#   namespace   = var.f5xc_namespace
#   monitoring = true
#   default_detection_settings = true
#   use_default_blocking_page  = true
#   allow_all_response_codes = true
#   custom_anonymization {
#     dynamic "anonymization_config" {
#       for_each = var.anonymization_config_list
#       content {
#         dynamic "http_header" {
#           for_each = anonymization_config.value.header_name != "" ? [1] : []
#           content {
#             header_name = anonymization_config.value.header_name
#           }
#         }
#         dynamic "query_parameter" {
#           for_each = anonymization_config.value.query_param != "" ? [1] : []
#           content {
#             query_param_name = anonymization_config.value.query_param
#           }
#         }
#         dynamic "cookie" {
#           for_each = anonymization_config.value.cookie_name != "" ? [1] : []
#           content {
#             cookie_name = anonymization_config.value.cookie_name
#           }
#         }
#       }
#     }
#   }
# }

# Iteration not working length condition.

# resource "volterra_app_firewall" "test-fw-1" {
#   name        = var.f5xc_waf_name
#   namespace   = var.f5xc_namespace
#   monitoring = true
#   default_detection_settings = true
#   use_default_blocking_page  = true
#   allow_all_response_codes = true
#   custom_anonymization {
#     dynamic "anonymization_config" {
#       for_each = var.anonymization_config_list
#       content {
#         dynamic "http_header" {
#           for_each = length(trimspace(anonymization_config.value.header_name)) > 0 ? [anonymization_config.value.header_name] : []
#           content {
#             header_name = http_header.value
#           }
#         }
#         dynamic "query_parameter" {
#           for_each = length(trimspace(anonymization_config.value.query_param)) > 0 ? [anonymization_config.value.query_param] : []
#           content {
#             query_param_name = query_parameter.value
#           }
#         }
#         dynamic "cookie" {
#           for_each = length(trimspace(anonymization_config.value.cookie_name)) > 0 ? [anonymization_config.value.cookie_name] : []
#           content {
#             cookie_name = cookie.value
#           }
#         }
#       }
#     }
#   }
# }

# Iteration working with three lists.

resource "volterra_app_firewall" "test-fw-1" {
  name        = var.f5xc_waf_name
  namespace   = var.f5xc_namespace
  monitoring = true
  default_detection_settings = true
  use_default_blocking_page  = true
  allow_all_response_codes = true
  custom_anonymization {
    dynamic "anonymization_config" {
      for_each = var.cookie_names_list
      content {
        cookie {
          cookie_name = anonymization_config.value
        }
      }
    }

    dynamic "anonymization_config" {
      for_each = var.header_names_list
      content {
        http_header {
          header_name = anonymization_config.value
        }
      }
    }

    dynamic "anonymization_config" {
      for_each = var.query_param_names_list
      content {
        query_parameter {
          query_param_name = anonymization_config.value
        }
      }
    }
  }
}