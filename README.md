# Profile Web

A Laravel application running in a fully containerized Docker environment. No local PHP, Composer, Node, or MySQL installation required — just Docker Desktop.

Made by: I Putu Budha Aditya


## Requirements

Before you begin, ensure you have the following installed on your host machine:

| Tool | Version | Notes |
|------|---------|-------|
| Docker Desktop | 4.94+ | Must have WSL 2 backend enabled on Windows |
| Docker Compose | v2.x | Bundled with Docker Desktop |
| Git | Any recent | For cloning the repository |
| Node.js | v22.x (LTS) | Only needed if you want to run frontend tooling on the host |
| npm | v10.x | Bundled with Node 22 |

> **Note:** Node.js and npm are only required if you want to run `npm` commands on the host. The Docker build handles frontend assets automatically inside the container.

## Stack

| Component | Version | Purpose |
|-----------|---------|---------|
| PHP | 8.4 (FPM) | Application runtime |
| MySQL | 8.0 | Database |
| Nginx | 1.27 (Alpine) | Web server / reverse proxy |
| Node.js | 22 (Alpine) | Frontend asset building |
| Composer | 2 | PHP dependency manager |
| phpMyAdmin | 5 | Database administration UI |


