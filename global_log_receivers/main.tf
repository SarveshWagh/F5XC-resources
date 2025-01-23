resource "volterra_global_log_receiver" "name" {
  name = var.log-receiver-name
  namespace = var.mynamespace
  audit_logs = true
#   request_logs = true
#   security_events = true
#   dns_logs = true

  ns_list {
    namespaces = [ "wagh", "ross", "test" ]
  }
#   ns_all = true
#   ns_current = true
  
  http_receiver {
    uri = "https://s.wagh/logs"
    auth_none = true
    compression {
      compression_none = true
    }
    batch {
        timeout_seconds_default = true
        max_events_disabled = true
        max_bytes_disabled = true
    }
    no_tls = true
  }

#   azure_receiver {
#     connection_string {
#         blindfold_secret_info {
#             location = "http://namespace/my-azure-connection-secret/"
#         }
#     }
#     container_name = "my-az-container"
#     filename_options {
#         no_folder = true
#     }
#     compression {
#         compression_none = true
#     }
#     batch {
#         timeout_seconds_default = true
#         max_events_disabled = true
#         max_bytes_disabled = true
#     }
#   }

}