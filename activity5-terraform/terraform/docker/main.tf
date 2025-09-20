terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}


provider "docker" {}

# Create a Docker network 
resource "docker_network" "todo_network" {
    name = "todo-network"
}

# Pull the images from Docker Hub
resource "docker_image" "todo_service" {
    name         = "natawut/todo-service:release-2.1"
    keep_locally = false
}

resource "docker_image" "redis" {
    name         = "redis:latest"
    keep_locally = false
}

# Create Docker Containers
resource "docker_container" "todo_service" {
    image = docker_image.todo_service.image_id
    name  = "todo-service"
    ports {
        internal = 8000
        external = 8000
    }
    env = [
        "NOTIFICATION_HOST=notification",
        "REDIS_HOST=redis",
    ]
    networks_advanced {
        name = docker_network.todo_network.name
    }
    depends_on = [
        docker_container.redis
    ]
}

resource "docker_container" "redis" {
    image = docker_image.redis.image_id
    name  = "redis"
    ports {
        internal = 6379
        external = 6379
    }
    networks_advanced {
        name = docker_network.todo_network.name
    }
}
