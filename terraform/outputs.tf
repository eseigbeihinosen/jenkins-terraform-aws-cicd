output "vpc_id" {
  description = "ID of the Jenkins CI/CD VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_a_id" {
  description = "ID of public subnet A"
  value       = module.vpc.public_subnet_a_id
}

output "public_subnet_b_id" {
  description = "ID of public subnet B"
  value       = module.vpc.public_subnet_b_id
}

output "jenkins_instance_profile_name" {
  description = "Name of the Jenkins IAM instance profile"
  value       = module.iam.instance_profile_name
}

output "jenkins_iam_role_name" {
  description = "Name of the Jenkins IAM role"
  value       = module.iam.role_name
}

output "jenkins_instance_id" {
  description = "ID of the Jenkins EC2 instance"
  value       = module.jenkins.instance_id
}

output "jenkins_public_ip" {
  description = "Public IP address of the Jenkins EC2 instance"
  value       = module.jenkins.public_ip
}

output "jenkins_private_ip" {
  description = "Private IP address of the Jenkins EC2 instance"
  value       = module.jenkins.private_ip
}