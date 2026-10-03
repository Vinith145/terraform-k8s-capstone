# Input variables for Azure infrastructure

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  # Set via terraform.tfvars or environment variable ARM_SUBSCRIPTION_ID
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "centralindia"
}

variable "project_name" {
  description = "Project name used as prefix for all resources"
  type        = string
  default     = "devops-capstone"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "vnet_cidr" {
  description = "CIDR block for the Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  description = "CIDR blocks for subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "subnet_names" {
  description = "Names for the subnets"
  type        = list(string)
  default     = ["app-subnet", "mgmt-subnet"]
}