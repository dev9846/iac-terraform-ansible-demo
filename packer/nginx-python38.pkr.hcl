packer {
  required_plugins {
    amazon = {
      version = ">= 1.1.4"
      source  = "github.com/hashicorp/amazon"
    }
    ansible = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

variable "aws_region" {
  default = "ap-south-1"
}

variable "source_ami" {
  default = "ami-03edbe403ec8522ed"  # Amazon Linux 2
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ssh_username" {
  default = "ec2-user"
}

source "amazon-ebs" "nginx" {
  region                  = var.aws_region
  source_ami              = var.source_ami
  instance_type           = var.instance_type
  ssh_username            = var.ssh_username
  ami_name                = "iac-nginx-python38-{{timestamp}}"
  associate_public_ip_address = true

  temporary_key_pair_type = "ed25519"
}

build {
  sources = ["source.amazon-ebs.nginx"]

  provisioner "shell" {
    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras enable python3.8",
      "sudo yum install -y python3.8"
    ]
  }

provisioner "ansible" {
  playbook_file = "../ansible/playbook.yml"
  user          = "ec2-user"
}

}

