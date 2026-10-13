# Profile Web

A Laravel application running in a fully containerized Docker environment. No local PHP, Composer, Node, or MySQL installation required — just Docker Desktop.

Made by: I Putu Budha Aditya

---

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

---

## How To Run it
1. Clone Repository: `git clone git@github.com:budhaaditya12323-boop/profile-website.git`
2. Copy the example environment file and generate an application key: `cp .env.example .env`
3. Build and start docker container: `docker compose up -d --build`
> First build takes 5 - 10 minutes
4. Generate APP_KEY value: `docker compose exec php-fpm php artisan key:generate`
5. Run the database migrations: `docker compose exec php-fpm php artisan migrate`
6. Access the Applications via this url:
| Services | URL |
|----------|-----|
| Laravel APP | http://localhost:8000 |
| phpMyAdmin | http://localhost:8080 |
> Log into phpMyAdmin with the `DB_USERNAME` and `DB_PASSWORD` from your `.env` file. To log in as root, use the `MYSQL_ROOT_PASSWORD` value.
7. Voila! your container is up and ready to use
> To stop the container, you can use: `docker compose down`

# Make Sure to exclude `.env`, addressed it in `.gitignore` before push into your repo