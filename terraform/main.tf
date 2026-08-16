module "vpc" {
  source = "./modules/vpc"

  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr

  availability_zone_a = var.availability_zone_a
  availability_zone_b = var.availability_zone_b

  public_subnet_a_cidr = var.public_subnet_a_cidr
  public_subnet_b_cidr = var.public_subnet_b_cidr
}

module "jenkins_security_group" {
  source = "./modules/security-group"

  security_group_name = var.jenkins_security_group_name

  vpc_id = module.vpc.vpc_id

  jenkins_cidr = var.jenkins_cidr
}

module "iam" {
  source = "./modules/iam"

  role_name = var.jenkins_iam_role_name
}

module "jenkins" {
  source = "./modules/jenkins"

  instance_name = var.jenkins_instance_name
  ami_id        = data.aws_ssm_parameter.ubuntu_2404_ami.value
  instance_type = var.jenkins_instance_type

  subnet_id = module.vpc.public_subnet_a_id

  security_group_id = module.jenkins_security_group.security_group_id

  instance_profile_name = module.iam.instance_profile_name
}