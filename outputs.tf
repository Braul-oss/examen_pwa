output "resource_group_name" {
  value = data.azurerm_resource_group.main.name
}

output "virtual_network_name" {
  value = azurerm_virtual_network.examen.name
}

output "subnets" {
  description = "Nombre y rango de cada subred"
  value       = { for s in azurerm_virtual_network.examen.subnet : s.name => s.address_prefixes[0] }
}
