Prerequisite: Working knowledge of Terraform with modules is a prerequisite.

Purpose of the Repository:
    1. The “z-end-to-end-automation” repository is designed to reduce manual effort in provisioning resources on XC.
    2. While it may not be the most optimized setup yet, it serves as a strong foundation for further efficiency improvements.
    3. The repository automates the creation of multiple child resources and seamlessly ties them to the parent object: the HTTP Load Balancer (LB).

Scope: Single 'Terraform apply' will result in the below:
    1. A Health Check object is created.
    2. Once the Health Check is successful, an Origin Pool object is created.
    3. A Prefix Set object is created.
    4. Once the Prefix Set is successful, a Service Policy object is created.
    5. A Firewall, MUM Policy, User Identification, and Primary DNS Zone are created.
    6. Once all the above resources are successfully provisioned, the parent object (HTTP Load Balancer) is created with sample routes, where the child objects are automatically attached to it.

Flow Description:
	1.	Health Check → Connects to Origin Pool
	2.	Origin Pool → Connects to HTTP Load Balancer
	3.	Firewall, MUM Policy, Service Policy, User Identification → All attach to HTTP Load Balancer
	4.	Prefix Sets → Used within Service Policy
	5.	Primary DNS Zone → Handles DNS whenever new apps gets onboarded on XC [apps that are delegated to XC]
	6.	HTTP Load Balancer → Parent object that consumes traffic for all apps thats onboarded on it.