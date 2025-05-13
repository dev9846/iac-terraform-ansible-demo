# iac-terraform-ansible-demo
Infrastructure as Code: Terraform, Ansible, Packer with HTTPS &amp; NGINX on AWS

# Infrastructure as Code: Terraform + Ansible + Packer on AWS

This project demonstrates a complete infrastructure-as-code workflow using **Terraform**, **Ansible**, and **Packer** to provision and configure an NGINX web server on AWS with HTTPS enabled. GitHub Actions is used for CI/CD.

## 🔧 Tools Used

- **Terraform** – To provision AWS infrastructure
- **Ansible** – To configure the EC2 instance with NGINX and HTTPS
- **Packer** – (Bonus) To build a pre-configured AMI with Ansible
- **GitHub Actions** – CI pipeline for validating and applying Terraform code

---

## 🧱 Project Structure

```bash
.
├── modules/               # Reusable Terraform modules (VPC, EC2, SG)
├── env/dev/               # Environment-specific config
├── ansible/               # Ansible playbook and inventory
├── packer/                # Packer template to build NGINX AMI
├── .github/workflows/     # GitHub Actions CI/CD workflow
├── screenshots/           # Screenshots of AWS and HTTPS access
├── README.md              # This file
└── .gitignore

Features:

VPC with public subnet and IGW
EC2 instance with SSH, HTTP, and HTTPS security group
Ansible installs and configures NGINX with a self-signed SSL cert
Packer builds a reusable AMI with preinstalled NGINX
GitHub Actions automates Terraform format/validate and plan

Setup Prerequisites

AWS CLI with credentials configured
Terraform >= 1.3
Ansible
Packer (optional)
SSH key pair created in AWS

# Notes:
1. Make sure you have s3 backend bucket already created and use it in backend.
2. Create a key pair in AWS EC2 Console and update key_name in terraform.tfvars. Ensure the downloaded .pem is available locally for SSH access.

Deploy:
cd env/dev
terraform init
terraform plan
terraform apply

Run Ansible:
ansible-playbook -i inventory ../ansible/nginx_setup.yml

Contributing:
Feel free to fork this repo and contribute by opening a PR!