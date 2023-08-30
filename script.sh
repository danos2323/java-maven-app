#!/bin/bash
# Pull the latest Docker image
docker pull danos23/java-ci-cd:latest
# Stop and remove the existing container (if it exists)
docker stop simple-java-maven-app || true
docker rm simple-java-maven-app || true
# Run the Docker container
docker run -d --name simple-java-maven-app -p 80:8080 danos23/java-ci-cd:latest
