resource "docker_image" "registry" {
  name = "registry:2"
}

resource "docker_container" "registry" {
  name  = "local-registry"
  image = docker_image.registry.image_id

  ports {
    internal = 5000
    external = 5000
  }

  restart = "unless-stopped"
}
