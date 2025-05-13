variable "vpc_id" {
  description = "VPC ID to associate the security group with"
  type        = string
}

variable "project" {
  description = "Project name for tagging"
  type        = string
}

variable "environment" {
  description = "Environment for tagging"
  type        = string
}
