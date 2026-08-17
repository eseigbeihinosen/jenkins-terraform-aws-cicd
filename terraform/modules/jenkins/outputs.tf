output "instance_id" {
  description = "ID of the Jenkins EC2 instance"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "Elastic IP address of the Jenkins EC2 instance"
  value       = aws_eip.this.public_ip
}

output "private_ip" {
  description = "Private IP address of the Jenkins EC2 instance"
  value       = aws_instance.this.private_ip
}