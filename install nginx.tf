provider "aws" {
  region = "us-east-1"
}

# Key Pair
resource "aws_key_pair" "my_key" {
  key_name   = "Terraform-key"
  public_key = "ssh-keygen"
}

# Default VPC
resource "aws_default_vpc" "default" {}

# Security Group
resource "aws_security_group" "my_security_group" {
  name   = "terraform-automate-sg"
  vpc_id = aws_default_vpc.default.id

  ingress {
    description = "port 22 allow"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "port 80 allow"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "port 443 allow"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "allow all outgoing traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-automate-sg"
  }
}

# EC2 Instance
resource "aws_instance" "using_terraform" {
  ami                    = "ami-0360c520857e3138f" # Ubuntu 22.04 us-east-1
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  user_data = file("${path.module}/script.sh")

  root_block_device {
    volume_size = 15
    volume_type = "gp3"
  }

  tags = {
    Name = "Terraform-EC2"
  }
}

# Output Public IP
output "ec2_public_ip" {
  value = aws_instance.using_terraform.public_ip
}
