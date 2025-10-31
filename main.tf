terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0d4cbf33677f7d3c5" # Amazon Linux 2 (ap-south-1)
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-GitHub-EC2"
  }
}

output "instance_id" {
  value = aws_instance.my_ec2.id
}
