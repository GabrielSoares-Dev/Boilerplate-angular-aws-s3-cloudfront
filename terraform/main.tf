terraform {
  required_version = ">= 1.2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket = "remote-state-devops-team"
    key    = "Boilerplate-angular-aws-amplify-terraform/terraform.tfstate"
    region = "sa-east-1"
  }
}