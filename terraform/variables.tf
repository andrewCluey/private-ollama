variable "location" {
  type        = string
  description = "Azure region where the resources will be created."
  default     = "uksouth"
}

variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 1
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. Set this value if you're running this example using Managed Identity as the authentication method."
  default     = null
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "azureadmin"
}

variable "node_size" {
  type        = string
  description = "The size of the nodes in the node pool."
  default     = "Standard_D4_v2"
}