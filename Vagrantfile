Vagrant.configure("2") do |config|
  config.vm.box = "debian/contrib-buster64"

  config.vm.define "vagpy" do |vagpy|
    vagpy.vm.hostname = "vagpy"
    vagpy.vm.network :"private_network", ip: "192.168.50.5",
      vitrualbox__intnet: true
    vagpy.vm.network "forwarded_port", guest:80, host:9000
    vagpy.vm.network "forwarded_port", guest:5000, host:9001
    vagpy.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y salt-minion
      echo "master: 192.168.50.1" > /etc/salt/minion
      echo "id: vagpy" >> /etc/salt/minion
      sudo systemctl restart salt-minion
    SHELL
  end
end









  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
