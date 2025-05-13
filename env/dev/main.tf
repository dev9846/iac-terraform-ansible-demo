provider "aws" {
  region = var.aws_region
}

# VPC Module
module "vpc" {
  source             = "../../modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
  project            = var.project
  environment        = var.environment
}

# Security Group Module
module "security_group" {
  source      = "../../modules/security_group"
  vpc_id      = module.vpc.vpc_id
  project     = var.project
  environment = var.environment
}

# EC2 Module
module "ec2" {
  source            = "../../modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id
  key_name          = var.key_name
  project           = var.project
  environment       = var.environment
}

output "ec2_public_ip" {
  value       = module.ec2.public_ip
  description = "Public IP of the EC2 instance"
}

