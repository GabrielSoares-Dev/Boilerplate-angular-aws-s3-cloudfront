resource "aws_amplify_app" "app" {
  name         = "Boilerplate-angular-aws-amplify-terraform-${var.environment}"
  repository   = "https://github.com/GabrielSoares-Dev/Boilerplate-angular-aws-amplify-terraform"
  access_token = var.access_token

  build_spec = <<-EOT
    version: 1
    frontend:
      phases:
        preBuild:
          commands:
            - npm ci
        build:
          commands:
            - npm run build
      artifacts:
        baseDirectory: dist/Boilerplate-angular-aws-amplify-terraform/browser
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT
}

resource "aws_amplify_branch" "master" {
  app_id      = aws_amplify_app.app.id
  branch_name = "master"
  framework   = "Angular"
}

resource "aws_amplify_webhook" "master" {
  app_id      = aws_amplify_app.app.id
  description = aws_amplify_app.app.name
  branch_name = aws_amplify_branch.master.branch_name
}
