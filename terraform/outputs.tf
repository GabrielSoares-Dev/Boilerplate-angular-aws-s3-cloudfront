output "webhook_trigger" {
  value = aws_amplify_webhook.master.url
  sensitive = true
}
