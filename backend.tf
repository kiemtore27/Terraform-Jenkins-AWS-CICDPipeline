terraform {
 backend "s3" {
    bucket = "s3-terraform-dk"
    key    = "projectaws/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}

