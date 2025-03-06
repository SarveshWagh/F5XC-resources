Flow Description:
	1.	Health Check → Connects to Origin Pool
	2.	Origin Pool → Connects to HTTP Load Balancer
	3.	Firewall, MUM Policy, Service Policy, User Identification → All attach to HTTP Load Balancer
	4.	Prefix Sets → Used within Service Policy
	5.	Primary DNS Zone → Handles DNS whenever new apps gets onboarded on XC [apps that are delegated to XC]
	6.	HTTP Load Balancer → Parent object that consumes traffic for all apps thats onboarded on it.