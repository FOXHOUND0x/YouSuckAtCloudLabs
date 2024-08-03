output "the0x_password" {
  value = random_password.password.result
  sensitive = true
}