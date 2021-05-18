# ripped from the docs
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
# ripped from the docs
provider "aws" {
  region = "us-east-1"
}



module "kraken-demo" {
  source  = "./modules/kraken-demo"
  
  name = var.demo_name
  suffix = var.suffix
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

