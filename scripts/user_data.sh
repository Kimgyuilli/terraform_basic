#!/bin/bash
# scripts/user_data.sh

# 시스템 업데이트 및 도커 설치
apt-get update -y
apt-get install -y docker.io
systemctl start docker
systemctl enable docker

# 애플리케이션 컨테이너 실행 (선행: ECR 또는 DockerHub에서 이미지 pull)
docker run -d -p 8080:8080 your-dockerhub-username/your-spring-app:latest

