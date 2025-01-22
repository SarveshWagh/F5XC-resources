resource "volterra_alert_receiver" "alert_receiver" {
  name = var.alert_receiver_name
  namespace = var.mynamespace

  #You have 6 alert receiver options/destinations to select from, to send the alerts you configure in the alert policy
  #Email, Opsgenie Pagerduty Slack SMS Webhook

#   slack {
#     url {
#         blindfold_secret_info {
#           decryption_provider = ""
#           location = ""
#           store_provider = ""
#         }
#     }
#     channel = "something"
#   }
  
  email {
    email = "something@example.com"
  }

#   sms {
#     contact_number = "+310644242117"
#   }

}