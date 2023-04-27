variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
  default = "westus"
}

variable "id-vnet-shared" {
  type = string
}

variable "name-vnet-shared" {
  type = string
}

variable "sub_app_address_space" {
  type = list(string)
}

variable "sub_data_address_space" {
  type = list(string)
}

variable "sub_endpoint_address_space" {
  type = list(string)
}

#vnet_name - nazwa tworzonej sieci
#vnet_address_space - zarkes adresacji tworzonej sieci
#rg_name - nazwa wykorzystywanej w kursie resource grupy
#location - lokalizacja wykorzystywanych w kursie zasobów (np. z resource grupy)
#id-vnet-shared - id sieci stworzonej w jednym z poprzednich zadań
#name-vnet-shared - nazwa sieci stworzonej w jednym z poprzednich zadań
#sub_app_address_space - zarkes adresacji tworzonej podsieci app
#sub_data_address_space - zarkes adresacji tworzonej podsieci data
#sub_endpoint_address_space - zarkes adresacji tworzonej podsieci endpoint