# 🚀 NGINX Landing Page with Docker

A modern **NGINX-themed landing page** built using **HTML, CSS, and JavaScript**, containerized with **Docker** and served using **NGINX** running as a **non-root user** for improved security.

---

## 📋 Project Overview

This project demonstrates how to:

* Build a responsive NGINX landing page.
* Serve static HTML using an NGINX Docker container.
* Run NGINX as a **non-root user**.
* Configure NGINX to listen on **port 8080**.
* Package the application using Docker for easy deployment.

---

## 📁 Project Structure

```text
.
├── Dockerfile
├── index.html
└── README.md
```

---

# ✨ Features

* 🎨 Modern responsive UI
* 🌙 Dark and Light theme toggle
* 📱 Mobile navigation menu
* ⚡ Animated status indicator
* 📊 Statistics cards
* 🐳 Dockerized deployment
* 🔒 Runs NGINX as a non-root user
* 🚀 Lightweight Alpine Linux image

---

# 🛠 Prerequisites

Before running the project, install:

* [Docker Desktop](https://www.docker.com/products/docker-desktop/) (Windows/macOS)

or

* [Docker Engine](https://docs.docker.com/engine/install/) (Linux)

Verify Docker is installed:

```bash
docker --version
```

Example:

```text
Docker version 29.x.x
```

---

# 📂 Step 1 — Clone the Repository

```bash
git clone https://github.com/your-username/your-repository.git
```

Move into the project directory:

```bash
cd your-repository
```

---

# 📂 Step 2 — Verify the Files

Ensure the directory contains:

```text
Dockerfile
index.html
README.md
```

---

# 🏗 Step 3 — Build the Docker Image

Run:

```bash
docker build -t nginx-image .
```

### What this command does

* Reads the `Dockerfile`
* Downloads the `nginx:alpine-slim` image (if not already available)
* Copies `index.html`
* Creates a Docker image named:

```text
nginx-image
```

---

# ▶ Step 4 — Run the Container

Run:

```bash
docker run -d -p 8080:8080 --name nginx-container nginx-image
```

### Explanation

| Option                   | Meaning                                    |
| ------------------------ | ------------------------------------------ |
| `-d`                     | Run in detached mode                       |
| `-p 8080:8080`           | Maps host port 8080 to container port 8080 |
| `--name nginx-container` | Assigns a container name                   |
| `nginx-image`            | Docker image to run                        |

---

# 🌐 Step 5 — Open the Application

Open your browser and visit:

```text
http://localhost:8080
```

You should see the NGINX landing page.

---

# 🧱 How the Dockerfile Works

The Dockerfile performs the following steps.

## 1. Uses the official NGINX Alpine image

```dockerfile
FROM nginx:alpine-slim
```

A lightweight Linux image with NGINX preinstalled.

---

## 2. Creates a non-root user

```dockerfile
RUN addgroup -S nginxgroup && \
    adduser -S nginxuser -G nginxgroup
```

Running as a non-root user is considered a Docker security best practice.

---

## 3. Removes the default NGINX webpage

```dockerfile
RUN rm -rf /usr/share/nginx/html/*
```

Deletes the default welcome page.

---

## 4. Copies the application

```dockerfile
COPY index.html /usr/share/nginx/html/
```

Your custom webpage replaces the default content.

---

## 5. Sets ownership

```dockerfile
RUN chown -R nginxuser:nginxgroup ...
```

Allows the non-root user to access the required directories.

---

## 6. Creates the PID file

```dockerfile
RUN touch /var/run/nginx.pid
```

Ensures NGINX can start correctly as a non-root user.

---

## 7. Changes the listening port

```dockerfile
listen 8080;
```

Since non-root users cannot bind to privileged ports such as **80**, NGINX is configured to use **8080**.

---

## 8. Switches to the non-root user

```dockerfile
USER nginxuser
```

All remaining processes run without root privileges.

---

## 9. Starts NGINX

```dockerfile
CMD ["nginx", "-g", "daemon off;"]
```

Runs NGINX in the foreground so the container stays alive.

---

# 🐳 Useful Docker Commands

## View running containers

```bash
docker ps
```

---

## View container logs

```bash
docker logs nginx-container
```

---

## Stop the container

```bash
docker stop nginx-container
```

---

## Start the container again

```bash
docker start nginx-container
```

---

## Remove the container

```bash
docker rm -f nginx-container
```

---

## Remove the Docker image

```bash
docker rmi nginx-image
```

---

# 🔄 Rebuild After Making Changes

If you modify `index.html`, rebuild the image.

Stop and remove the old container:

```bash
docker rm -f nginx-container
```

Rebuild:

```bash
docker build -t nginx-image .
```

Run again:

```bash
docker run -d -p 8080:8080 --name nginx-container nginx-image
```

---

# 🔒 Security Features

* Uses the lightweight `nginx:alpine-slim` image
* Runs NGINX as a non-root user
* Uses port **8080** instead of privileged port **80**
* Restricts file ownership to the application user

---

# 📚 Technologies Used

* HTML5
* CSS3
* JavaScript (ES6)
* Docker
* NGINX
* Alpine Linux

---

# 📄 License

This project is provided for educational and demonstration purposes. Feel free to modify and use it in your own projects.
