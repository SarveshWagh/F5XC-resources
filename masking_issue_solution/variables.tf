# variable "anonymization_config_list" {
#   type = list(object({
#     header_name = string
#     query_param = string
#     cookie_name = string
#   }))
# }

variable "cookie_names_list" {
  type = list(string)
}

variable "header_names_list" {
  type = list(string)
}

variable "query_param_names_list" {
  type = list(string)
}

variable "mynamespace" {
  type = string
}

variable "firewall_name" {
  type = string
}

variable "api_p12_file" {
  type        = string
  description = "REQUIRED:  This is the path to the Volterra API Key.  See https://volterra.io/docs/how-to/user-mgmt/credentials"
}

variable "api_url" {
  type        = string
  description = "REQUIRED:  This is your Volterra API url"
}