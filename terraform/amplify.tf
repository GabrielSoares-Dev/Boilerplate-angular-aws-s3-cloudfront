resource "aws_amplify_app" "app" {
  name         = "Boilerplate-angular-aws-amplify-terraform-${var.environment}"
  repository   = var.repository_url
  access_token = var.access_token
  enable_branch_auto_build = true
  build_spec   = <<-EOT
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
  enable_auto_build = true

  framework = "Angular"
  stage     = var.environment
}