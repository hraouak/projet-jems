Here's a step by step guide 

NB: the user is "mapr" and the password too.

- Start VM
$ vagrant up

- Copy files
vagrant scp ../ansible vm-projet:/home/mapr/ansible
vagrant scp ../app vm-projet:/home/mapr/app
vagrant scp ../data vm-projet:/home/mapr/data
vagrant scp ../hive vm-projet:/home/mapr/hive
vagrant scp ../spark vm-projet:/home/mapr/spark

- SSH VM
$ vagrant ssh

- install ansible
sudo yum-config-manager --save --setopt=MapR_Core.skip_if_unavailable=true
sudo yum-config-manager --save --setopt=MapR_Ecosystem.skip_if_unavailable=true
sudo yum-config-manager --save --setopt=MapR_Installer.skip_if_unavailable=true
sudo yum --disablerepo=MapR_Core --disablerepo=MapR_Ecosystem --disablerepo=MapR_Installer install ansible -y





vagrant plugin install vagrant-vbguest
vagrant vbguest --do install --no-cleanup







0) Turn down VM
    $ Vagrant halt

And enjoy!








oozie : /opt/mapr/oozie/oozie-4.3.0/bin/oozie job -oozie "http://localhost:11000/oozie" -config hive/hive_job.properties -run


spark-submit : /opt/mapr/spark/spark-2.3.1/bin/spark-submit --class com.exemple.script.App target/project-1.0-SNAPSHOT.jar
