variable "my_enviroment" {
  description = "Instance type for the EC2 instance"
  default     = "dev"
  type        = string
}


variable "Kubernetes_version" {
  description = "Kubernetes version for the EKS cluster"
  default     = "1.32"
  type        = string
}