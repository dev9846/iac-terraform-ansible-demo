variable "ami_id" {
  description = "AMI ID to launch the instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
}

variable "security_group_id" {
  description = "Security group to associate with the instance"
  type        = string
}

variable "key_name" {
  description = "SSH key name to access the instance"
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
