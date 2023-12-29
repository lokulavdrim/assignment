provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

module "vpc" {
  source = "../vpc"
}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion-security-group"
  description = "Security group for the EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "bastion_host" {
  ami                  = var.bastion_ami
  instance_type        = "t2.micro"
  key_name             = "bastion_key" 
  subnet_id     = module.vpc.public_subnet_id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "BastionHost"
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id                  =  var.public_subnet_id
  cidr_block              = "10.0.1.0/24"  
  availability_zone       = "us-east-1a"   
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
  }
}

