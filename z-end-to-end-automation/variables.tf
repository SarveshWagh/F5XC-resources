variable "useridentname" {
  type        = string
  description = "This is the user identification policy name"
}

variable "servicepolicyname" {
  type        = string
  description = "This is the service policy name"
}

variable "prefixsetname" {
  type        = string
  description = "This is the name of the prefix set"
}

variable "mum_policy_name" {
  type        = string
  description = "This is the name of the MUM policy"
}

variable "add_hsts" {
  type        = bool
  description = "This is an indication if you require hsts header to be added in the request"
}

variable "no_mtls" {
  type        = bool
  description = "This is an indication if you require mTLS"
}

variable "port" {
  type        = string
  description = "This is an indication if you require mTLS"
}

variable "http_redirect" {
  description = "This is an indication if you require http to https redirect or not."
  type        = bool
}

variable "http_lb_name" {
  description = "The name of the HTTP LB."
  type        = string
}

variable "firewall_name" {
  description = "The name of the app firewall."
  type        = string
}

variable "origin_pool_name" {
  description = "The name of the origin pool."
  type        = string
}

variable "health_check_name" {
  description = "The name of the health check."
  type        = string
}

variable "mynamespace" {
  description = "The name of the namespace."
  type        = string
}

variable "api_p12_file" {
  type        = string
  description = "REQUIRED:  This is the path to the Volterra API Key.  See https://volterra.io/docs/how-to/user-mgmt/credentials"
}

variable "api_url" {
  type        = string
  description = "REQUIRED:  This is your Volterra API url"
}