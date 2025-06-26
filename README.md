``` mermaid
flowchart TD
  subgraph "Virtual Site"
    node1["node-1"]
    node2["node-2"]
    node3["node-3"]
  end
 
  cloud["F5 XC REs"]
 
  %% Two tunnels per node
  cloud ---|IPsec| node1
  cloud ---|IPsec| node1
 
  cloud ---|IPsec| node2
  cloud ---|IPsec| node2
 
  cloud ---|IPsec| node3
  cloud ---|IPsec| node3
 
```
