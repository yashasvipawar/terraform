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
 
resource "docker_image" "image_id" {
  name = "${lookup(var.image_name, var.env)}"
}
 
#Start the Container
resource "docker_container" "ghost_container" {
  name  = "${lookup(var.container_name, var.env)}"
  image = "${docker_image.image_id.latest}"
  ports {
    internal = "${var.int_port}"
    external = "${lookup(var.ext_port, var.env)}"
  }
}