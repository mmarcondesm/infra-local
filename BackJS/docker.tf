resource "docker-image" "backend" {
  name = "localhost:5000/meu-backend:latest"

  build {
    context = "../backjs" 
    dockerfile = "Dockerfile"
  }
}

resource "docker_registry_image" "backend_push" {
  name = docker_image.backend.name
  depends_on = [docker_container.registry]
}

resource "docker_container" "backend" {
  name  = "meu-backend-app"
  image = docker_image.backend.image_id

  ports {
    internal = 3000
    external = 3000
  }

  depends_on = [
    docker_registry_image.backend_push
  ]
}