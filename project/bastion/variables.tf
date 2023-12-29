variable "region" {
  default = "us-east-1"
}

variable "bastion_ami" {
  default = "ami-"  
}
variable "public_subnet_id" {
  default = "10.0.1.0/24"
}