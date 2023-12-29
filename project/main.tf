terraform {
  backend "s3" {
    bucket = "lavdrims-bucket"  
    key    = "terraform.tfstate"
    region = "us-east-1"  
  }
}

provider "aws" {
  region     =  "us-east-1"
  access_key = ""
  secret_key = ""
}

module "vpc" {
  source = "./vpc"
}

module "bastion" {
  source        = "./bastion"
  public_subnet_id = "10.0.1.0/24"  
}


module "rds" {
  source = "./rds"
  bastion_sg_id = "bastion.bastion_sg_id"
}
