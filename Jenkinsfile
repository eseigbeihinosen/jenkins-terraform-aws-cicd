pipeline {
    agent any

    options {
        timestamps()
        disableConcurrentBuilds()
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Format Check') {
            steps {
                dir('terraform') {
                    sh 'terraform fmt -check -recursive'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init -input=false'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('terraform') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Generate Terraform Variables') {
            steps {
                dir('terraform') {
                    writeFile file: 'terraform.tfvars', text: '''
aws_region = "us-east-1"

vpc_name = "jenkins-cicd-vpc"

vpc_cidr = "10.0.0.0/16"

availability_zone_a = "us-east-1a"
availability_zone_b = "us-east-1b"

public_subnet_a_cidr = "10.0.1.0/24"
public_subnet_b_cidr = "10.0.2.0/24"

jenkins_security_group_name = "jenkins-sg"

jenkins_cidr = "105.127.15.22/32"

jenkins_iam_role_name = "jenkins-ec2-role"

jenkins_instance_name = "jenkins-server"
jenkins_instance_type = "t3.small"
'''
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan -input=false -out=tfplan'
                }
            }
        }

        stage('Approval') {
            steps {
                input message: 'Terraform plan completed. Apply these changes?', ok: 'Apply'
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -input=false tfplan'
                }
            }
        }
    }

    post {
        always {
            sh 'rm -f terraform/terraform.tfvars terraform/tfplan'
        }

        success {
            echo 'Terraform CI/CD pipeline completed successfully.'
        }

        failure {
            echo 'Terraform CI/CD pipeline failed. Check the console output.'
        }
    }
}

