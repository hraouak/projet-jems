sudo yum-config-manager --disable MapR_Core
sudo subscription-manager repos --disable=MapR_Core
sudo yum-config-manager --save --setopt=MapR_Core.skip_if_unavailable=true
sudo yum --disablerepo=MapR_Installer install ansible -y
