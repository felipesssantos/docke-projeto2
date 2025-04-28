#!/bin/bash

MASTER_IP=$1
echo "Configurando o nó Worker do Docker Swarm..."

# Verifica se o arquivo de token existe
if [ -f /vagrant/worker-token.txt ]; then
    WORKER_TOKEN=$(cat /vagrant/worker-token.txt)
    
    # Join no swarm
    docker swarm join --token $WORKER_TOKEN $MASTER_IP:2377
    echo "Nó Worker adicionado ao cluster com sucesso!"
else
    echo "Arquivo de token não encontrado. Aguarde a inicialização do master e tente novamente."
    exit 1
fi
