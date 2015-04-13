Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.synced_folder "./", "/vagrant", type: "nfs"
    config.vm.network "private_network", ip: "192.168.50.12"

    config.vm.provision :shell, :inline => <<-END
        set -e
        if ! which ansible-playbook ; then
            sudo sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"
            sudo sh -c "
                echo deb http://get.docker.io/ubuntu docker main > \
                /etc/apt/sources.list.d/docker.list
            "
            sudo apt-get update
            sudo apt-get -y install \
                lxc-docker \
                python-software-properties \
                python-pip
            sudo pip install ansible
        fi
    END
end
