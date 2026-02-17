variable "env" {
  description = "Environment name"
  type        = string
}


variable "billing_mode" {
  description = "Billing mode for DynamoDB table"
  default     = "PAY_PER_REQUEST"
  type        = string
}

variable "instance_type" {
  description = "value of the instance type"
  type        = string
}

variable "ami" {
  description = "value of the ami"
  type        = string
}