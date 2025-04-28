# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Imagem base para as VMs
  config.vm.box = "ubuntu/focal64"
  
  # Configuração de rede privada para todas as máquinas
  config.vm.network "private_network", type: "dhcp"
  
  # Recursos padrão para todas as máquinas
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.cpus = 1
  end
  
  # Instalar Docker em todas as máquinas
  config.vm.provision "shell", path: "scripts/install-docker.sh"
  
  # Definição das máquinas
  
  # Master node
  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "192.168.56.10"
    
    # Configurar como nó manager do Swarm
    master.vm.provision "shell", path: "scripts/setup-master.sh"
    
    # Recursos adicionais para o master
    master.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
  end
  
  # Worker nodes
  (1..3).each do |i|
    config.vm.define "node0#{i}" do |node|
      node.vm.hostname = "node0#{i}"
      node.vm.network "private_network", ip: "192.168.56.#{i + 10}"
      
      # Configurar como worker do Swarm
      node.vm.provision "shell", path: "scripts/setup-worker.sh", args: ["192.168.56.10"]
    end
  end
  
  # Mensagem após a criação de todas as VMs
  config.vm.post_up_message = "Cluster Swarm configurado! Use 'vagrant ssh master' para acessar o nó manager."
end
