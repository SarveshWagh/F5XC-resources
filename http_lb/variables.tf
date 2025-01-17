variable "lbname" {
  description = "The name of the load balancer."
  type        = string
}

variable "mynamespace" {
  description = "The name of the namespace."
  type        = string
}

variable "mydescription" {
  description = "This is the description for the load balancer."
  type        = string
}

variable "http_redirect" {
  type        = bool
  description = "This is an indication if you require http to https redirect or not"
}

variable "add_hsts" {
  type        = bool
  description = "This is an indication if you require hsts header to be added in the request"
}

variable "no_mtls" {
  type        = bool
  description = "This is an indication if you require mTLS"
}

variable "poolname1" {
  type        = string
  description = "This is the origin pool name 1"
}

variable "poolname2" {
  type        = string
  description = "This is the origin pool name 2"
}

variable "poolname3" {
  type        = string
  description = "This is the origin pool name 3"
}

variable "appfirewallname1" {
  type        = string
  description = "This is the 1st app firewall"
}

variable "appfirewallname2" {
  type        = string
  description = "This is the 2nd app firewall inside one of the routes"
}

variable "api_p12_file" {
  type        = string
  description = "REQUIRED:  This is the path to the Volterra API Key.  See https://volterra.io/docs/how-to/user-mgmt/credentials"
}

variable "api_url" {
  type        = string
  description = "REQUIRED:  This is your Volterra API url"
}