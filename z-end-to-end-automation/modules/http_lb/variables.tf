variable "this_is_originpool1_namespace" {
  description = "The namespace of the 1st origin pool from origin_pool module"
  type        = string
}

variable "this_is_originpool1" {
  description = "The name of the 1st origin pool from origin_pool module"
  type        = string
}

variable "this_is_userident_namespace" {
  description = "The namespace of the user identification policy from user_identification module"
  type        = string
}

variable "this_is_userident" {
  description = "The name of the user identification policy from user_identification module"
  type        = string
}

variable "this_is_sp_namespace" {
  description = "The namespace of the service policy from service_policy module"
  type        = string
}

variable "this_is_servicepolicy" {
  description = "The name of the service policy from service_policy module"
  type        = string
}

variable "this_is_mum" {
  description = "The name of the MUM policy from mum_policy module"
  type        = string
}

variable "this_is_mum_namespace" {
  description = "The name of the namespace of MUM policy from mum_policy module"
  type        = string
}

variable "this_is_fw" {
  description = "The name of the firewall that comes from firewall module"
  type        = string
}

variable "this_is_fw_namespace" {
  description = "The name of the firewall namespace that comes from firewall module"
  type        = string
}

variable "httplbname_insidemodule" {
  description = "The name of the load balancer."
  type        = string
}

variable "domainlist_insidemodule" {
  description = "The list of domain names."
  type        = list(string)
}

variable "mynamespace_insidemodule" {
  description = "The name of the namespace."
  type        = string
}

variable "http_redirect_insidemodule" {
  type        = bool
  description = "This is an indication if you require http to https redirect or not"
}

variable "add_hsts_insidemodule" {
  type        = bool
  description = "This is an indication if you require hsts header to be added in the request"
}

variable "no_mtls_insidemodule" {
  type        = bool
  description = "This is an indication if you require mTLS"
}

variable "port_insidemodule" {
  type        = string
  description = "This is an indication if you require mTLS"
}