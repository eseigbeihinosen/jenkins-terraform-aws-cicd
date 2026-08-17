terraform {
  backend "s3" {
    bucket       = "jenkins-terraform-state-168381254318-us-east-1"
    key          = "jenkins-cicd/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}