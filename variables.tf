# vpc variables
variable "vpc-cidr" { 
   default     = "10.0.0.0/16"
   description = "vpc cidr block"
   type        = string
}

variable "public_subnet_az1-cidr" { 
   default     = "10.0.0.0/24"
   description = "public subnet az1 cidr block"
   type        = string
}

variable "public_subnet_az2-cidr" { 
   default     = "10.0.1.0/24"
   description = "public subnet az2 cidr block"
   type        = string
}


variable "private_app_subnet_az1-cidr" { 
   default     = "10.0.2.0/24"
   description = "private app subnet az1 cidr block"
   type        = string
}

variable "private_app_subnet_az2-cidr" { 
   default     = "10.0.3.0/24"
   description = "private app subnet az2 cidr block"
   type        = string
}


variable "private_data_subnet_az1-cidr" { 
   default     = "10.0.4.0/24"
   description = "private data subnet az1 cidr block"
   type        = string
}

variable "private_data_subnet_az2-cidr" { 
   default     = "10.0.5.0/24"
   description = "private data subnet az2 cidr block"
   type        = string
}

# security group variables
variable "ssh_location" {
  default = "0.0.0.0/0"
  description = "the ip addresss that can ssh into the ec2 instances"
  type = string
}

# rds variables
variable "database-snapshot-identifier" {
  default = "snapshot arn"
  description = "the database snapshot arn"
  type = string
}

variable "database-instance_class" {
  default = "db.t2.micro"
  description = "the database instance type"
  type = string
}

variable "database-instance_identifier" {
  default = "dev-rds-db"
  description = "the database instance identifier"
  type = string
}

variable "multi-az-deployment" {
  default = false
  description = "create a stanby db instance"
  type = bool
}

#application load balancer variables
variable "ssl_certification_arn" {
  default = "ssl_certification_arn"
  description = "ssl certification arn"
  type = string
}
#sns topic variable
variable "operator-email" {
  default = "kiemtore27@gmail.com"
  description = "a valid email address"
  type = string
}

# auto scaling group variables
variable "launch_template-name" {
  default = "dev-launch-template"
  description = "name of the launch template"
  type = string
}


variable "ec2_image_id" {
  default = "ec2-ami-arn"
  description = "id of the ami"
  type = string
}

variable "ec2_instnace_type" {
  default = "t2.micro"
  description = "the ec2 instance type"
  type = string
}

variable "ec2_key_pair_name" {
  default = "terraform-aws-key"
  description = "name of the key pair"
  type = string
}

#route 53 variables
variable "domain_name" {
  default = "weblabskiem.ml"
  description = "domain name"
  type = string
}

variable "record_name" {
  default = "www"
  description = "sub domain name"
  type = string
}
