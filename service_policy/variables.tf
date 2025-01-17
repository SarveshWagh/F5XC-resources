variable "mynamespace" {
  type        = string
  description = "This is the name of the namespace where service policy will be created"
}

variable "servicepolicyname" {
  type        = string
  description = "This is the service policy name"
}

variable "api_p12_file" {
  type        = string
  description = "REQUIRED:  This is the path to the Volterra API Key.  See https://volterra.io/docs/how-to/user-mgmt/credentials"
}

variable "api_url" {
  type        = string
  description = "REQUIRED:  This is your Volterra API url"
}