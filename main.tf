terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.2"
    }
  }

  required_version = ">=0.15"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "firstEC2" {
  #count                  = 3
  #for_each = var
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.week3.key_name
  vpc_security_group_ids = [aws_security_group.acssg1.id]
  tags                   = var.tags

  #lifecycle {
  #create_before_destroy = true
  #prevent_destroy = true
  # ignore_changes = [
  # ami,
  #instance_type,
  #tags
  #]
  #}

}

resource "aws_key_pair" "week3" {
  key_name   = "week3"
  public_key = file("week3.pub")
}

resource "aws_security_group" "acssg1" {
  name        = "acssg1"
  description = "Allow SSH & Http traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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

resource "aws_s3_bucket" "week4s3" {
  bucket = "acs730-week4-wed"
  #depends_on = [aws_instance.firstEC2]
}
