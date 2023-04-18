module "conventions" {
  source        = "github.com/CloudRico/Uplift-modules.git?ref=v1"
  enviroment    = var.enviroment
  workload      = var.workload
  instance      = "${count.index}"
  resource_type = "resourcegroup"
  application   = var.application
}




resource "azurerm_resource_group" "resource_group" {
    count                    = 3
    name                     = var.name != "" ? var.name : module.conventions.name
    location                 = var.location != "" ? var.location :module.conventions.allowed_location_type
}