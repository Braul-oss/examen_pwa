# Grupo de recursos existente (creado en el lab4); solo se consulta, no se administra aquí
data "azurerm_resource_group" "main" {
  name = "rg-utvt-integradora-dev-mxc-001"
}

resource "azurerm_virtual_network" "examen" {
  name                = "vnet-utvt-examen-dev-mxc-001"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]

  # Integración de App Service
  # El Excel indica 10.0.1.0/18, que no es un CIDR válido; se usa 10.0.1.0/24
  subnet {
    name             = "snet-utvt-examen-app-dev-mxc-001"
    address_prefixes = ["10.0.1.0/24"]

    delegation {
      name = "app-service"

      service_delegation {
        name    = "Microsoft.Web/serverFarms"
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    }
  }

  # Base de datos (reservada)
  subnet {
    name             = "snet-utvt-examen-db-dev-mxc-001"
    address_prefixes = ["10.0.2.0/25"]
  }

  # Máquina virtual
  subnet {
    name             = "snet-utvt-examen-vm-dev-mxc-001"
    address_prefixes = ["10.0.3.0/27"]
  }

  # Private Endpoints
  subnet {
    name             = "snet-utvt-examen-pe-dev-mxc-001"
    address_prefixes = ["10.0.4.0/29"]
  }

  tags = var.tags
}
