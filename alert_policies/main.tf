resource "volterra_alert_policy" "alert_policy_name" {
  name = var.alert_policy_name
  namespace = var.mynamespace
  receivers {
    name = var.alert_receiver_name
    namespace = var.mynamespace
  }
  # You can choose from the following "alertname, alertname_regex, any, custo, group, severity"
  routes {
    send = true
    severity {
        severities = [ "Major" ]
    }
  }
  routes {
    send = true
    alertname_regex = "\\\\b(CRITICAL|ERROR|WARNING)\\\\b"
  }
  routes {
    send = true
    any = true
    #If you would like to alter the time frames for alert policies you can do so like below
    notification_parameters {
        default = true
        repeat_interval = "30m"
        group_wait = "30s"
        group_interval = "10m"
    }
  }
}