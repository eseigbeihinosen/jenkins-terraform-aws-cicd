resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  iam_instance_profile = var.instance_profile_name

  associate_public_ip_address = true

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = var.instance_name
  }
}

resource "aws_eip" "this" {
  domain = "vpc"

  instance = aws_instance.this.id

  tags = {
    Name = "${var.instance_name}-eip"
  }
}