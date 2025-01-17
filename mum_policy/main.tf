resource "volterra_malicious_user_mitigation" "name" {
  name = var.mum_name
  namespace = var.mynamespace
  mitigation_type {
    rules {
      threat_level {
        low = true
      }
      mitigation_action {
        captcha_challenge = true
      }
    }
    rules {
      threat_level {
        medium = true
      }
      mitigation_action {
        javascript_challenge = true
      }
    }
    rules {
      threat_level {
        high = true
      }
      mitigation_action {
        block_temporarily = true
      }
    }
  }
}