terraform {
    required_providers {
        azurerm1 = {
            source = "hashicorp/azurerm"
            version = "~>2.5.0"
        }

    }
}

provider "azurerm1" {

    features {}
  
}

resource "azurerm_resource_group" "minecraft-rg" {

    name = "uk-south-minecraft-rg"
    location = "uksouth"
}

resource "azurerm_container_group" "minecraftmk1" {
    name = "minecraft1"
    location = azurerm_resource_group.minecraft-rg.location
    resource_group_name = azurerm_resource_group.minecraft-rg.name
    ip_address_type = "public"
    dns_name_label = "wearethemillersminecraft"
    os_type = "Linux"

    container {
      name = "minecraftfirstgo"
      image = "hashicraft/minecraft:v1.17.1-fabric"
      
      cpu = "1"
      memory = "2"

      ports {
          port = 25565
          protocol = "TCP"
      }


      environment_variables = {
        "ALLOW_NETHER" = "true"
        "MINECRAFT_MOTD" = "no nob heads allowed"
        "WHITELIST_ENABLED" = "true"
        "RCON_PASSWORD" = "Hiemdall01"
        "RCON_ENABLED" = "true"
        "RCON_PORT" = "27015"
        "OVERRIDE_SERVER_PROPERTIES" = "true"
        "SPAWN_ANIMALS" = "true"
        "SPAWN_NPCS" = "true"
        
      }



    }
  
  
}

