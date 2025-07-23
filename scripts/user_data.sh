#!/bin/bash
# scripts/user_data.sh

# �ý��� ������Ʈ �� ��Ŀ ��ġ
apt-get update -y
apt-get install -y docker.io
systemctl start docker
systemctl enable docker

# ���ø����̼� �����̳� ���� (����: ECR �Ǵ� DockerHub���� �̹��� pull)
docker run -d -p 8080:8080 your-dockerhub-username/your-spring-app:latest

