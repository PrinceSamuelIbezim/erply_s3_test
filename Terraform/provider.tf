terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }


  backend "s3" {
    bucket         = "erply-bucket-to-storestate-for-my-test-task"
    key            = "terraform/s3_website/state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }

  required_version = ">= 1.0"
}


# Configure the AWS Provider
provider "aws" {
  region     = var.aws_region

  default_tags {
    tags = {
      Project     = "erply_s3_website"
      Environment = "Dev"
    }
  }
}