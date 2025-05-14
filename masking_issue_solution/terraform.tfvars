firewall_name = "test-new-fw"
mynamespace = "wagh"
# anonymization_config_list = [
#     {
#         header_name = "header1"
#         query_param = "qp1"
#         cookie_name = "cookie1"
#     },
#     {
#         header_name = "header2"
#         query_param = "qp2"
#         cookie_name = "cookie2"
#     }
# ]
cookie_names_list       = ["cookie1", "cookie2"]
header_names_list       = ["header1", "header2"]
query_param_names_list  = ["qp1", "qp2"]
api_p12_file  = "./sdc-support.console.ves.volterra.io.api-creds.p12"
api_url       = "https://sdc-support.console.ves.volterra.io/api"