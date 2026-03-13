# Terraform variables file

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ec2_instance_type" {  
  description = "The instance type of the EC2 instance"
  default     = "t2.micro"
}

variable "db_username" {  
  description = "The username for the database"
  default     = "admin"
}

variable "db_password" {  
  description = "The password for the database"
  default     = "password"
}

variable "db_instance_class" {  
  description = "The instance class for the database"
  default     = "db.t2.micro"
}

variable "db_name" {  
  description = "The name of the database"
  default     = "mydb"
}

variable "vpc_cidr_block" {  
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {  
  description = "CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr_block" {  
  description = "CIDR block for the public subnet"
  default     = "10.0.2.0/24"
}

variable "private_subnet_cidr_block" {  
  description = "CIDR block for the private subnet"
  default     = "10.0.3.0/24"
}
