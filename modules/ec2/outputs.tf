output "instance_id" {
  value       = aws_instance.web.id
  description = "The ID of the EC2 instance"
}

output "public_ip" {
  value       = aws_instance.web.public_ip
  description = "Public IP address of the EC2 instance"
}
