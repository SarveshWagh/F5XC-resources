module "health_check" {
  source = "./modules/health_check"
  mynamespace_insidemodule = var.mynamespace
  health_check_name_insidemodule = var.health_check_name
}

module "origin_pool" {
  source = "./modules/origin_pool"
  origin_pool_name_insidemodule = var.origin_pool_name
  mynamespace_insidemodule = var.mynamespace
  originip_insidemodule = var.originip
  this_is_hc = module.health_check.hc_name
  this_is_hc_namespace = module.health_check.hc_namespace
}

module "firewall" {
  source = "./modules/firewall"
  firewall_name_insidemodule = var.firewall_name
  mynamespace_insidemodule = var.mynamespace
}

module "prefix_sets" {
  source = "./modules/prefix_sets"
  prefixsetname_insidemodule = var.prefixsetname
  mynamespace_insidemodule = var.mynamespace
}

module "service_policy" {
  source = "./modules/service_policy"
  servicepolicyname_insidemodule = var.servicepolicyname
  mynamespace_insidemodule = var.mynamespace
  this_is_prefixset = module.prefix_sets.prefixset_name
  this_is_ip_prefix_set_namespace = module.prefix_sets.prefixset_namespace
}

module "user_identification" {
  source = "./modules/user_identification"
  useridentname_insidemodule = var.useridentname
  mynamespace_insidemodule = var.mynamespace
}

module "mum_policy" {
  source = "./modules/mum_policy"
  mum_policy_name_insidemodule = var.mum_policy_name
  mynamespace_insidemodule = var.mynamespace
}

module "primary_dns_zone" {
  source = "./modules/primary_dns_zone"
  dns_zone_name_insidemodule = var.dns_zone_name
  dns_zone_namespace_insidemodule = var.dns_zone_namespace
}

module "http_lb" {
  source = "./modules/http_lb"
  httplbname_insidemodule = var.http_lb_name
  domainlist_insidemodule = var.domainlist
  mynamespace_insidemodule = var.mynamespace
  http_redirect_insidemodule = var.http_redirect
  add_hsts_insidemodule = var.add_hsts
  no_mtls_insidemodule = var.no_mtls
  port_insidemodule = var.port
  
  this_is_fw = module.firewall.fw_name
  this_is_fw_namespace = module.firewall.fw_namespace
  
  this_is_mum_namespace = module.mum_policy.mum_namespace
  this_is_mum = module.mum_policy.mum_name
  
  this_is_servicepolicy = module.service_policy.sp_name
  this_is_sp_namespace = module.service_policy.sp_namespace

  this_is_userident = module.user_identification.userident_name
  this_is_userident_namespace = module.user_identification.userident_namespace
  
  this_is_originpool1 = module.origin_pool.originpool1_name
  this_is_originpool1_namespace = module.origin_pool.originpool1_namespace
}