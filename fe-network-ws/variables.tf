variable "frontend_vpc_address_space" {
  description = "The CIDR block for the frontend VPC."
  default     = "10.9.0.0/16"
}

variable "frontend_prefix" {
  description = "The prefix for the frontend resources."
  default     = "frontend"
}

variable "frontend_environment" {
  description = "The environment for the frontend resources."
  default     = "dev"
}

variable "region" {
  description = "The region where the resources are created."
  default     = "ap-northeast-1"
}

variable "frontend_public_subnet_cidr" {
  description = "The CIDR block for the frontend public subnets."
  default     = ["10.9.1.0/24", "10.9.2.0/24", "10.9.3.0/24"]
}

variable "frontend_private_subnet_cidr" {
  description = "The CIDR block for the frontend private subnets."
  default     = ["10.9.253.0/24", "10.9.254.0/24", "10.9.255.0/24"]
}