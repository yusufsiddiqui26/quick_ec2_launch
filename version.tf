terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.55.0"
    }
  }
}


# terraform {
#   backend "s3" {

#     bucket = "yss-terraform-project-backend"
#     access_key = "terraform.tfstate"
#     region = "us-east-1"
#   }  
# }

provider "aws" {
    region = var.region
}