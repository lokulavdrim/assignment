terraform {
  backend "s3" {
    bucket = "lavdrims-bucket"  
    key    = "terraform.tfstate"
    region = "us-east-1"  
  }
}

provider "aws" {
  region = "us-east-1"
  
}

module "vpc" {
  source = "./vpc"

}

module "bastion" {
  source              = "./bastion"
  
  public_subnet_cidr  = module.vpc.public_subnet_cidr  
  
}

module "rds" {
  source         = "./rds"
  bastion_sg_id  = module.bastion.bastion_sg_id 
}

