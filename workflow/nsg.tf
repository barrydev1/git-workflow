resource "azurerm_network_security_group" "git-workflow" {
  name                = "testSecurityGroup1"
  location            = azurerm_resource_group.git-workflow.location
  resource_group_name = azurerm_resource_group.git-workflow.name

  security_rule {
    name                       = "nsgrule01"
    priority                   = 600
    direction                  = "outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "10.10.10.10/32"
  }

  # Allow HTTP requests from internet
  security_rule {
    name                       = "nsgrule02"
    priority                   = 650
    direction                  = "inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "10.10.10.10/32"
  }

  tags = {
    environment = "Test"
  }
}