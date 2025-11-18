Project Structure for Azure Landing Zone

<img width="396" height="1927" alt="image" src="https://github.com/user-attachments/assets/4dc0b21d-aeed-4230-b42e-fad90571310d" />

<img width="838" height="613" alt="image" src="https://github.com/user-attachments/assets/5b4b95a4-8e1b-4218-af32-d72de8129c9d" />

<img width="447" height="840" alt="image" src="https://github.com/user-attachments/assets/2c5470ae-0fd2-4147-b708-c393bc2b3cef" />

-----------------------------------------------------------------------------------------------------
| Order  |   Module Name                   | Why / Dependency                                        |
| -------| --------------------------------|-------------------------------------------------------- |
|   1    |azurerm_resource_group           | Everything must be inside a Resource Group              |
|   2    |azurerm_virtual_network          | VNet requires Resource Group                            |
|   3    |azurerm_subnet                   | Subnets require VNet                                    |
|   4    |azurerm_network_security_group   | NSG requires Resource Group                             |
|   5    |azurerm_storage_account          | Storage Account requires RG                             |
|   6    |azurerm_virtual_machine          | Needs subnet + NSG + Storage Account                    |
|   7    |azurerm_lb                       | Load Balancer needs subnet or Public IP                 |
|   8    |azurerm_application_gateway      | Requires dedicated subnet + Public IP                   |
|   9    |azurerm_bastion_host             | Needs Bastion subnet + Public IP                        |
|   10   |azurerm_kubernetes_cluster (AKS) | Needs RG + VNet + Subnet + Storage Account              |
|   11   |azurerm_key_vault                | Needs RG; may depend on VM/AKS identities               |
|   12   |azurerm_mssql_server             | SQL Server needs RG + admin login + optional VNet rules |
|   13   |azurerm_mssql_database           | SQL Database needs SQL Server                           |
|   14   |azurerm_mssql_firewall_rule      | Optional; allows external/IP access to SQL Server       |
|   15   |azurerm_private_endpoint         | Optional; SQL Server private access via VNet            |
------------------------------------------------------------------------------------------------------
Resource Group
     ↓
VNet → Subnets
     ↓
NSG → VM → Key Vault
     ↓
PIP → LB → AppGW → Bastion
     ↓
Storage Account
     ↓
AKS Cluster
     ↓
SQL Server → SQL Database → Firewall Rules → Private Endpoint


