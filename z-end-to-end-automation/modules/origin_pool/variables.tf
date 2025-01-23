variable "this_is_hc_namespace" {
  description = "The name of the namespace that comes from health_check module"
  type        = string
}

variable "this_is_hc" {
  description = "The name of the health check that comes from health_check module"
  type        = string
}

variable "origin_pool_name_insidemodule" {
  description = "The name of the origin pool."
  type        = string
}

variable "mynamespace_insidemodule" {
  description = "The name of the namespace."
  type        = string
}