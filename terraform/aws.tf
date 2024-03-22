provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      "owner"        = "DevopsTeam"
      "project-name" = "Boilerplate-angular-aws-amplify-terraform-${lower(var.environment)}"
      "managed-by"   = "terraform"
    }
  }
}
