#!/bin/bash

echo "Instalando Docker..."

# Atualizar lista de pacotes
apt-get update

# Instalar pacotes necessários
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Adicionar chave GPG do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Adicionar repositório do Docker
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Instalar Docker Engine
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

# Iniciar e habilitar o Docker
systemctl enable docker
systemctl start docker

# Adicionar usuário vagrant ao grupo docker
usermod -aG docker vagrant

echo "Docker instalado com sucesso!"
