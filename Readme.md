Here's a step by step guide 

NB: the user is "mapr" and the password too.

-Start VM

sudo yum-config-manager --save --setopt=MapR_Core.skip_if_unavailable=true
sudo yum-config-manager --save --setopt=MapR_Ecosystem.skip_if_unavailable=true
sudo yum-config-manager --save --setopt=MapR_Installer.skip_if_unavailable=true

- install ansible
sudo yum --disablerepo=MapR_Core --disablerepo=MapR_Ecosystem --disablerepo=MapR_Installer install ansible -y

- install git
sudo yum --disablerepo=MapR_Core --disablerepo=MapR_Ecosystem --disablerepo=MapR_Installer install git -y

- get app file
git clone https://github.com/hraouak/projet-jems.git
cd projet-jems
ansible-playbook ansible/main.yml




vagrant plugin install vagrant-vbguest
vagrant vbguest --do install --no-cleanup







0) Turn down VM
    $ Vagrant halt

And enjoy!








oozie : /opt/mapr/oozie/oozie-4.3.0/bin/oozie job -oozie "http://localhost:11000/oozie" -config hive/hive_job.properties -run


spark-submit : /opt/mapr/spark/spark-2.3.1/bin/spark-submit --class com.exemple.script.App target/project-1.0-SNAPSHOT.jar
