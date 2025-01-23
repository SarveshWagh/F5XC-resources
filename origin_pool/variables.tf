variable "origin_pool_name" {
  description = "The name of the origin pool."
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