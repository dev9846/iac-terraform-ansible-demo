resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.key_name
  associate_public_ip_address = true
  root_block_device {
    volume_size = var.ebs_size
    volume_type = "gp3"
    encrypted = var.encryption
  }

  tags = {
    Name = "${var.project}-ec2"
    Project = var.project
    Environment = var.environment
  }
}
