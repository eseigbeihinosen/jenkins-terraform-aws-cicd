resource "aws_security_group" "this" {
  name        = var.security_group_name
  description = "Security group managed by Terraform"
  vpc_id      = var.vpc_id

  ingress {
    description = "Jenkins Webhook"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}