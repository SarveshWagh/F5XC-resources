#This terraform script creates a default WAF object on the XC console as is.
#Please read the instructions and make the changes accordingly if you would like to alter the default configuration.

resource "volterra_app_firewall" "app-fw-1" {
  name        = var.appfirewall
  description = var.mydescription
  namespace   = var.mynamespace
  
  #Enforcement mode
  blocking    = false # This can be set to 'true' when you wish to go to mitigation
  default_detection_settings = true #Use "Security Policy Settings" if you would like to alter it 
  
#"Security Policy Settings starts"
  detection_settings {
    signature_selection_setting {
        
        default_attack_type_settings = true #Use below code if you would like to alter the "Attack Signatures and Signature Selection By Accuracy"
        
        #Attack Signatures
        # attack_type_settings {
        #   disabled_attack_types = [ "ATTACK_TYPE_BUFFER_OVERFLOW", "ATTACK_TYPE_COMMAND_EXECUTION" ]
        # }

        #Signature Selection By Accuracy
        high_medium_low_accuracy_signatures = true #1 #You can use one 1,2 or 3
        # high_medium_accuracy_signatures = true #2
        # only_high_accuracy_signatures = true #3

    }
    
    #Automatic Attack Signatures Tuning
    disable_suppression = true
    # enable_suppression = true

    # Attack Signatures Staging
    disable_staging = true

    # Use below code if you would like to alter the "Attack Signatures Staging"
    # stage_new_signatures {
    #   staging_period = 7
    # }

    # stage_new_and_updated_signatures {
    #   staging_period = 7
    # }
    
    # Threat Campaigns
    disable_threat_campaigns = true
    # enable_threat_campaigns = true

    # Violations
    default_violation_settings = true 
    #Use below code if you would like to alter the "Attack Signatures and Signature Selection By Accuracy"
    
    # violation_settings {
    #   disabled_violation_types = [ "VIOL_HTTP_PROTOCOL_BAD_HTTP_VERSION", "VIOL_EVASION_BARE_BYTE_DECODING" ]
    # }
    
    # Signature-Based Bot Protection
    default_bot_setting = true

    #Use below code if you would like to alter the "Signature-Based Bot Protection"
    # bot_protection_setting {
    #     good_bot_action = "Block"
    #     suspicious_bot_action = "Report"
    #     malicious_bot_action = "Block"
    # }
  }
  # "Security Policy Settings ends"

  #Advanced configuration

  #Allowed Response Status Codes
  allow_all_response_codes = true
  #Use below code if you would like to alter "Allowed Response Status Codes"
#   allowed_response_codes {
#     response_code = [ 200, 201 ]
#   }

  # Mask Sensitive Parameters in Logs
  default_anonymization = true
  #disable_anonymization = true

# Use below code if you would like to alter "Mask Sensitive Parameters in Logs"
#   custom_anonymization {
#     anonymization_config {
#       http_header {
#         header_name = "testheader"
#       }
#     }
#   }

  use_default_blocking_page = true
# Use below code if you would like to alter the "Blocking response page"
#   blocking_page {
#     response_code = "ResetContent"
#     blocking_page = "string:///PGh0bWw+PGhlYWQ+PHRpdGxlPlJlcXVlc3QgUmVqZWN0ZWQ8L3RpdGxlPjwvaGVhZD48Ym9keT5UaGUgcmVxdWVzdGVkIFVSTCB3YXMgcmVqZWN0ZWQuIFBsZWFzZSBjb25zdWx0IHdpdGggeW91ciBhZG1pbmlzdHJhdG9yLjxici8+PGJyLz5Zb3VyIHN1cHBvcnQgSUQgaXM6IHt7cmVxdWVzdF9pZH19PGJyLz48YnIvPjxhIGhyZWY9ImphdmFzY3JpcHQ6aGlzdG9yeS5iYWNrKCkiPltHbyBCYWNrXTwvYT48L2JvZHk+PC9odG1sPg=="
#   }
}