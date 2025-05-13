variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "availability_zone" {
  description = "AWS availability zone for the subnet"
  type        = string
}

variable "project" {
  description = "Project name for tagging resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment name (dev/staging/prod)"
  type        = string
}
