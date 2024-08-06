# Gitlab-CI-CD
Fundamental CI/CD Project
Gitlab CI/CD
Installation 
Docker
Nginx
Git
Gitlab runner ( install from official documentation of Gitlab)
Create repository on Gitlab
Clone your repository
Git clone “ Paste your repos link ”
Enter your e-mail of GItlab “”
Password of Gitlab””
Register your gitlab runner from setting (CI/CD) your epository
Use https:// instead http
Lock to your current project



Create file of .gitlab-ci.yml
stages:
  - build     ( define your stages)
  - deploy
  - test

variables:
  DOCKER_IMAGE: 'medi' (name of your docker image)

build:
  stage: build
  tags:
    - pclass-zaman1 (name of your register runner)
  script:
    - echo "Building Docker image..."
    - docker build -t $DOCKER_IMAGE .( $ variable)

deploy:
  stage: deploy      (call the stage)
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
    - '[[ $(curl -s -o /dev/null -w "%{http_code}" http://103.151.111.182:8001) == "200" ]]'






Dockerfile





FROM nginx:latest

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
   











