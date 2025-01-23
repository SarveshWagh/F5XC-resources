resource "volterra_malicious_user_mitigation" "e2e-mum" {
  name = var.mum_policy_name_insidemodule
  namespace = var.mynamespace_insidemodule
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