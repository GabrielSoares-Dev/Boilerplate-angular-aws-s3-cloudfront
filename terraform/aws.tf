provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      "owner"        = "DevopsTeam"
      "project-name" = "Boilerplate-angular-aws-s3-cloudfront-${lower(var.environment)}"
      "managed-by"   = "terraform"
    }
  }
}


provider "aws" {
  alias  = "us_east-1"
  region = "us-east-1"

  default_tags {
    tags = {
      "owner"        = "DevopsTeam"
      "project-name" = "Boilerplate-angular-aws-s3-cloudfront-${lower(var.environment)}"
      "managed-by"   = "terraform"
    }
  }
}
