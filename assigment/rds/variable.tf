variable "region" {
  default = "us-east-1"
}

variable "rds_engine" {
  default = "mysql"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "your_db_password" 
}
variable "bastion_sg_id" {
  type = string
}

