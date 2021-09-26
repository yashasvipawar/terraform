terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.12.2"
    }
  }
}
provider "docker" {
 host    = "npipe:////.//pipe//docker_engine"
}



# Download the latest Ghost Image
resource "docker_image" "ghost_image" {
  name = "${var.image_name}"
}

# Start the Container
resource "docker_container" "ghost_container" {
  name  = "${var.container_name}"
  image = "${docker_image.ghost_image.latest}"
  ports {
    internal = "2368"
    external = "${var.ext_port}"
  }
}