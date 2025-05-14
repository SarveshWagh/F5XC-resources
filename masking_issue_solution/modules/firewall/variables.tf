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

variable "f5xc_namespace" {
  type = string
}

variable "f5xc_waf_name" {
  type = string
}