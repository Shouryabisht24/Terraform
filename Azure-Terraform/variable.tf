variable "cluster_name" {
  description = "AKS cluster name"
  type        = string
  default     = "aks-prod"
}

variable "node_count" {
  description = "Number of nodes"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "VM size for nodes"
  type        = string
  default     = "Standard_E2s_v3"
}

variable "environment" {
  description = "Environment (dev/staging/prod)"
  type        = string
  default     = "dev"
}
