#!/bin/bash
{
  echo "[START] Running user_data.sh"
  
  # �⺻ ��Ű�� ��ġ
  apt-get update -y
  echo "[INFO] apt-get update completed"
  
  # Docker ��ġ
  apt-get install -y docker.io docker-compose-v2
  echo "[INFO] Docker and Docker Compose installed"
  
  # Docker ���� ����  
  systemctl start docker
  systemctl enable docker
  echo "[INFO] Docker service started and enabled"
  
  # ����ڸ� docker �׷쿡 �߰�
  usermod -aG docker ubuntu
  echo "[INFO] User added to docker group"
  
  # ���ø����̼� ���丮 ����
  mkdir -p /opt/app
  cd /opt/app
  
  # ȯ�溯�� ���� ����
  cat > .env << EOF
DB_USERNAME=postgres
DB_PASSWORD=your_production_password_here
SPRING_PROFILES_ACTIVE=prod
EOF
  
  # Docker Compose ���� ����
  cat > docker-compose.prod.yml << 'EOF'
version: '3.8'

services:
  backend:
    image: kimgyuill/recruit-backend:latest
    container_name: piro-recruit-app
    ports:
      - "8080:8080"
    depends_on:
      db:
        condition: service_healthy
    env_file:
      - .env
    environment:
      - SPRING_PROFILES_ACTIVE=prod
    networks:
      - backend
    restart: always

  db:
    image: postgres:15
    container_name: piro-recruit-db
    env_file:
      - .env
    environment:
      - POSTGRES_DB=piro-recruit
      - POSTGRES_USER=${DB_USERNAME}
      - POSTGRES_PASSWORD=${DB_PASSWORD}
    volumes:
      - postgres-data:/var/lib/postgresql/data
    networks:
      - backend
    restart: always
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U ${DB_USERNAME}"]
      interval: 10s
      timeout: 5s
      retries: 5

volumes:
  postgres-data:

networks:
  backend:
EOF
  
  # Docker Compose�� ���ø����̼� ����
  docker compose -f docker-compose.prod.yml up -d
  echo "[INFO] Application stack started with Docker Compose"
  
} > /var/log/user_data.log 2>&1
