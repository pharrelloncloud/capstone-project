terraform {
  backend "s3" {
    bucket         = "capstone-terraform-state-236664963412"
    key            = "capstone/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP and NodePort access"

  ingress { 
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30080
    to_port     = 30080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "k3s" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name      = var.key_name
  security_groups = [aws_security_group.web_sg.name]

}

