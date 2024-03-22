provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      "owner"        = "DevopsTeam"
      "project-name" = "Boilerplate-angular-aws-amplify-terraform-${var.environment}"
      "managed-by"   = "terraform"
    }
  }
}
