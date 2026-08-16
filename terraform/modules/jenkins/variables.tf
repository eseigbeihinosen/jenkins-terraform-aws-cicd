variable "instance_name" {
  description = "Name of the Jenkins EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the Jenkins EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for Jenkins"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where Jenkins will be deployed"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for Jenkins"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile attached to Jenkins"
  type        = string
}