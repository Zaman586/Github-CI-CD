# Fundamental CI/CD Project

This project demonstrates the basic setup and use of GitLab CI/CD to build, deploy, and test a Dockerized web application using Nginx.

## Prerequisites

Ensure the following software is installed:
- Docker
- Nginx
- Git
- GitLab Runner (follow the official GitLab documentation for installation)

## Setup

### Step 1: Create a GitLab Repository

1. Create a repository on GitLab.
2. Clone your repository:

    ```bash
    git clone <your-repository-link>
    ```

3. Enter your GitLab credentials when prompted.

### Step 2: Register GitLab Runner

1. Navigate to your repository's **Settings** -> **CI/CD** -> **Runners**.
2. Register your GitLab runner:

    ```bash
    gitlab-runner register
    ```

### Step 3: Create `.gitlab-ci.yml`

Create a `.gitlab-ci.yml` file in the root of your repository with the following content:

```yaml
stages:
  - build
  - deploy
  - test

variables:
  DOCKER_IMAGE: 'medi'

build:
  stage: build
  tags:
    - pclass-zaman1
  script:
    - echo "Building Docker image..."
    - docker build -t $DOCKER_IMAGE .

deploy:
  stage: deploy
  tags:
    - pclass-zaman1
  script:
    - echo "Deploying Docker container..."
    - docker stop pclass-zaman1 || true
    - docker rm pclass-zaman1 || true
    - docker run -d --name pclass-zaman1 -p 8001:80 $DOCKER_IMAGE

test:
  stage: test
  tags:
    - pclass-zaman1
  script:
    - echo "Testing if the server is up..."
    - apt-get update && apt-get install -y curl
    - sleep 10
    - '[[ $(curl -s -o /dev/null -w "%{http_code}" http://103.151.111.182:8001) ==










