variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zone_a" {
  description = "First Availability Zone"
  type        = string
}

variable "availability_zone_b" {
  description = "Second Availability Zone"
  type        = string
}

variable "public_subnet_a_cidr" {
  description = "CIDR block for public subnet A"
  type        = string
}

variable "public_subnet_b_cidr" {
  description = "CIDR block for public subnet B"
  type        = string
}

variable "jenkins_security_group_name" {
  description = "Name of the Jenkins security group"
  type        = string
}

variable "jenkins_cidr" {
  description = "CIDR block allowed to access Jenkins"
  type        = string
}

variable "jenkins_iam_role_name" {
  description = "Name of the IAM role for Jenkins"
  type        = string
}

variable "jenkins_instance_name" {
  description = "Name of the Jenkins EC2 instance"
  type        = string
}

variable "jenkins_instance_type" {
  description = "EC2 instance type for Jenkins"
  type        = string
}