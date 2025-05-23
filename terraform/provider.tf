provider "aws" {
  region = var.region

  default_tags {
    tags = local.tags
  }
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "044060693635-tf-state"
    region  = "us-east-1"
    key     = "terraform.tfstate"

  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.34"
    }
  }
}