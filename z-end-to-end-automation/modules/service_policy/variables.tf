variable "this_is_prefixset" {
  type        = string
  description = "This is the name of the namespace where service policy will be created that comes from prefix_sets module"
}

variable "this_is_ip_prefix_set_namespace" {
  type        = string
  description = "This is the name of the namespace where the IP prefix set that comes from prefix_sets module"
}

variable "mynamespace_insidemodule" {
  type        = string
  description = "This is the name of the namespace where service policy will be created"
}

variable "servicepolicyname_insidemodule" {
  type        = string
  description = "This is the service policy name"
}