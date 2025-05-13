# 🚀 IaC Demo Project: Terraform + Packer + Ansible + GitHub Actions

![CI/CD](https://github.com/dev9846/iac-terraform-ansible-demo/actions/workflows/ci-cd.yml/badge.svg)
![Security Hardened](https://img.shields.io/badge/security-hardened-brightgreen?style=flat-square\&logo=shield)
![License](https://img.shields.io/github/license/dev9846/iac-terraform-ansible-demo)

---

## 📦 Overview

This project demonstrates a production-ready Infrastructure-as-Code (IaC) pipeline using:

* **Terraform** (modular structure)
* **Packer** (for baking secure AMIs)
* **Ansible** (for NGINX + HTTPS configuration)
* **GitHub Actions** (CI/CD automation)

It provisions a secured EC2 instance on AWS with NGINX configured to serve over **HTTPS** using a self-signed certificate.

---

## 🧱 Architecture

```text
GitHub Actions
    |
    |---> Packer builds hardened AMI with Ansible
    |
    |---> Terraform deploys infra using that AMI

Outputs:
  - Encrypted EC2 instance
  - NGINX with SSL (self-signed)
  - Security Group 
```

---

## 📂 Project Structure

```
.
├── .github/workflows/ci-cd.yml       # GitHub Actions pipeline
├── packer/nginx-python3.8-ami.json   # Packer config (uses Ansible)
├── ansible/nginx_setup.yml           # Ansible playbook to configure NGINX + SSL
├── modules/                          # Terraform modules
└── env/dev/                          # Terraform environment config
    ├── main.tf
    ├── variables.tf
    ├── terraform.auto.tfvars         # AMI ID is auto-written here
```

---

🔧 Tools Used
Terraform – To provision AWS infrastructure
Ansible – To configure the EC2 instance with NGINX and HTTPS
Packer – (Bonus) To build a pre-configured AMI with Ansible
GitHub Actions – CI pipeline for validating and applying Terraform code


---

## 🔐 Security Highlights

* **Disk Encryption**: EBS volumes encrypted via AWS KMS
* **SSL Enabled**: NGINX serves over HTTPS (self-signed)
* **No Secrets in Code**: All credentials managed via GitHub Secrets


---

## ⚙️ GitHub Actions Pipeline

* ✅ **Build AMI** using Packer with Ansible
* ✅ **Extract AMI ID** and write to Terraform tfvars
* ✅ **Apply infrastructure** via Terraform in `env/dev`
* ✅ **Run on push to `main` or manual dispatch**

---

## 🚀 Getting Started (Local)

### Prerequisites

* AWS CLI + credentials with EC2/IAM/S3 access
* Terraform
* Packer
* Python + Ansible

### Manual Steps

```bash
# Build AMI
cd packer
packer build nginx-python3.8-ami.json

# Update AMI ID in env/dev/terraform.tfvars

# Deploy infrastructure
cd ../../env/dev
terraform init
terraform apply
```

---

## ✅ Features

* Full automation from AMI to deployment
* Modular, reusable Terraform code
* Production-style Ansible provisioning baked into AMI
* CI/CD that runs cleanly on push to `main` with option to skip CI/CD if mention [Skip ci] in comment.
* Secure-by-default infrastructure

---

## 🧹 TODO (Future Enhancements)

* [ ] Use Let's Encrypt instead of self-signed SSL
* [ ] Add tfsec or Checkov security scans
* [ ] Use GitHub OIDC instead of access keys
* [ ] Add CloudWatch logging and alarms
* [ ] Rolling deployments using `create_before_destroy`

---

## 📜 License

[MIT](./LICENSE)

---

> Created with ❤️ by Devang Pandya — built for speed, security, and interviews.
