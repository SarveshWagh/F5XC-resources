module "firewall" {
  source = "./modules/firewall"
  f5xc_waf_name = var.firewall_name
  f5xc_namespace = var.mynamespace
  cookie_names_list = var.cookie_names_list
  header_names_list = var.header_names_list
  query_param_names_list = var.query_param_names_list
}