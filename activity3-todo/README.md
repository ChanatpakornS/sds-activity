# Acitivity: To-Do Microservices

### Objective

- [x] Network name: todo-net

- [x] todo-webapp (src=release-3.1) – map port: container 3000 to host 3000

- [x] todo (src=release-3) – set name to todo-service

  - [x] set environment variable NOTIFICATION_HOST to notification
  - [x] set environment variable REDIS_HOST to redis

- [x] todo-notification (src=release-1.1) set name to notification-service

  - [x] set environment variable REDIS_HOST to redis

- [x] API Gateway (using NGINX) – map port: container 8000 to host 8000 – set name to api-gateway

### What I've stucked and ended up with

1. Forget to add ENV to Notification service, Todo service, so it can't connect to Redis service
