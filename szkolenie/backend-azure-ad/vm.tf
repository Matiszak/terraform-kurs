module "linuxservers" {
  source              = "Azure/compute/azurerm"
  resource_group_name = data.azurerm_resource_group.default.name
  vm_os_simple        = "UbuntuServer"
  vm_size             = "Standard_D2as_v5"
#  public_ip_dns       = ["linsimplevmips"] // change to a unique name per datacenter region
  vnet_subnet_id      = azurerm_subnet.zad2.id
  admin_password = "testtest1@34"
  
  remote_port = "22"

 # depends_on = [azurerm_resource_group.example]
}

output "linux_ip" {
  value = module.linuxservers.public_ip_address
}