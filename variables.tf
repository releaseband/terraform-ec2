locals {
  module_tags = {
    Function = var.function
    Name     = "${var.project_name}_${var.product_name}_${var.function}"
  }
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags for all resources"
  default = {
    Project = "Terraform"
    Product = "EC2"
  }
}

variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "product_name" {
  type        = string
  description = "Name of the product"
}

variable "function" {
  type        = string
  description = "Name of the function"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "rt_id" {
  type        = string
  description = "ID of the route table"
}

variable "subnet_metadata" {
  type        = map(string)
  description = "Metadata of the subnets"
}

variable "network_rules" {
  type        = map(list(string))
  description = "List of network rules"
}

variable "CPUCreditUsage_per_hour" {
  type        = number
  description = "CPU credit usage per hour"
}

variable "minimum_cpu_balance" {
  type        = number
  description = "Minimum CPU credit balance"
}

variable "sns_arn" {
  type        = string
  description = "ARN of the SNS topic"
}

variable "ec2_type" {
  type        = string
  description = "Type of the EC2 instance"
}

variable "sshkey" {
  type        = string
  description = "SSH key name"
}

variable "ami" {
  type        = string
  description = "AMI ID"
}

variable "user_data" {
  type        = string
  description = "User data"
}

variable "public_adress" {
  type        = bool
  description = "Public IP address"
}
