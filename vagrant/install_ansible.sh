sudo yum-config-manager --save --setopt=MapR_Core.skip_if_unavailable=true
sudo yum-config-manager --save --setopt=MapR_Ecosystem.skip_if_unavailable=true
sudo yum --disablerepo=MapR_Installer --disablerepo=MapR_Ecosystem install ansible -y
