# vpc variables
variable "vpc_cidr" { 
  default     = "10.0.0.0/16"
  description = "vpc cidr block"
  type        = string
}

variable "public_subnet_az1_cidr" { 
  default     = "10.0.0.0/24"
  description = "public subnet az1 cidr block"
  type        = string
}

variable "public_subnet_az2_cidr" { 
  default     = "10.0.1.0/24"
  description = "public subnet az2 cidr block"
  type        = string
}


variable "private_app_subnet_az1_cidr" { 
  default     = "10.0.2.0/24"
  description = "private app subnet az1 cidr block"
  type        = string
}

variable "private_app_subnet_az2_cidr" { 
  default     = "10.0.3.0/24"
  description = "private app subnet az2 cidr block"
  type        = string
}


variable "private_data_subnet_az1_cidr" { 
  default     = "10.0.4.0/24"
  description = "private data subnet az1 cidr block"
  type        = string
}

variable "private_data_subnet_az2_cidr" { 
  default     = "10.0.5.0/24"
  description = "private data subnet az2 cidr block"
  type        = string
}

# security group variables
variable "ssh_location" {
  default     = "0.0.0.0/0"
  description = "the ip address that can ssh into the ec2 instances"
  type        = string
}

# rds variables
variable "database_snapshot_identifier" {
  default     = "snapshot arn"
  description = "the database snapshot arn"
  type        = string
}

variable "database_instance_class" {
  default     = "db.t2.micro"
  description = "the database instance type"
  type        = string
}

variable "database_instance_identifier" {
  default     = "dev-rds-db"
  description = "the database instance identifier"
  type        = string
}

variable "multi_az_deployment" {
  default     = false
  description = "create a standby db instance"
  type        = bool
}

# application load balancer variables
variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
  default     = "dev-alb"
}

variable "target_group_name" {
  description = "Name of the Target Group"
  type        = string
  default     = "dev-alb-tg"
}

variable "target_group_port" {
  description = "Port for the Target Group"
  type        = number
  default     = 80
}

variable "ssl_certificate_arn" {
  description = "ARN of the SSL certificate for HTTPS listener"
  type        = string
}

# sns topic variable
variable "operator_email" {
  default     = "kiemtore27@gmail.com"
  description = "a valid email address"
  type        = string
}

variable "launch_template_name" {
  description = "Name of the EC2 launch template"
  type        = string
  default     = "webserver-launch-template"
}

variable "ec2_image_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ec2_key_pair_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "asg_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
  default     = "dev-asg"
}

variable "asg_instance_name" {
  description = "Tag name for instances in the ASG"
  type        = string
  default     = "asg-webserver"
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in ASG"
  type        = number
  default     = 2
}

variable "asg_max_size" {
  description = "Maximum number of instances in ASG"
  type        = number
  default     = 4
}

variable "asg_min_size" {
  description = "Minimum number of instances in ASG"
  type        = number
  default     = 1
}

variable "ec2_image_id" {
  default     = "ec2-ami-arn"
  description = "id of the ami"
  type        = string
}

variable "ec2_instance_type" {
  default     = "t2.micro"
  description = "the ec2 instance type"
  type        = string
}

variable "ec2_key_pair_name" {
  default     = "terraform-aws-key"
  description = "name of the key pair"
  type        = string
}

# route 53 variables
variable "domain_name" {
  default     = "weblabskiem.ml"
  description = "domain name"
  type        = string
}

variable "record_name" {
  default     = "www"
  description = "sub domain name"
  type        = string
}
