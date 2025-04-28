#!/bin/bash

echo "Configurando o nó Master do Docker Swarm..."

# Inicializar o swarm
docker swarm init --advertise-addr 192.168.56.10

# Gerar e salvar o token de join para workers
docker swarm join-token worker -q > /vagrant/worker-token.txt

echo "Nó Master configurado com sucesso!"
echo "Token para workers salvo em /vagrant/worker-token.txt"

# Exibir informações do cluster
echo "Informações do cluster:"
docker node ls
