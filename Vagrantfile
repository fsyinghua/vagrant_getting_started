# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6.0"

host_list = [
    {
        :name => "ansible-controller",
        :eth1 => "192.168.85.10",
        :mem => "2048",
        :cpu => "2",
		    :box => "generic/centos7",
        :box_url => "https://mirrors.ustc.edu.cn/centos-cloud/centos/7/vagrant/x86_64/images/CentOS-7.VMwareFusion.box",
        :script => "./centos_post.sh"

    },
    {
        :name => "ansible-node1",
        :eth1 => "192.168.85.11",
        :mem => "1024",
        :cpu => "1",
	    	:box => "generic/ubuntu1804",
        :box_url => "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/bionic/current/bionic-server-cloudimg-amd64-vagrant.box"
        :script => "./ubuntu_post.sh"
    },
    {
        :name => "ansible-node2",
        :eth1 => "192.168.85.12",
        :mem => "1024",
        :cpu => "1",
	    	:box => "generic/ubuntu2004",
        :box_url => "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/focal/current/focal-server-cloudimg-amd64-vagrant.box",
        :script => "./ubuntu_post.sh"
    }
]

Vagrant.configure(2) do |config|


  host_list.each do |item|
    config.vm.define item[:name] do |config|
      config.vm.box = item[:box]
      #config.vm.box_url = item[:box_url]
      config.vm.hostname = item[:name]
      config.vm.provider "vmware_desktop" do |v|
        v.vmx["memsize"] = item[:mem]
        v.vmx["numvcpus"] = item[:cpu]
      end

      config.vm.network :private_network, ip: item[:eth1]
      config.vm.provision "shell", privileged: false, path: item[:script]
    end
  end
  
end
