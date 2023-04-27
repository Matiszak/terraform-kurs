#variable "name" {
#  type = string
#}
#
#variable "hobbies" {
#  type = list(string)
#}
#
#locals {
#    single = "a"
#    welcome_message = "Hello, ${var.name}! Your hobbies are: %{ for entry in var.hobbies } ${entry}, %{ endfor }"
#}
#
#output "io" {
#    value = local.welcome_message
#}