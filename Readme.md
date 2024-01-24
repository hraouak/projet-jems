Here's a step by step guide 

1) VM Creation
    - Start VM
    $ vagrant up
    - provision vm
    $ vagrant provision
    - install plugin
    $ vagrant plugin install vagrant-scp
    - Copy files
    $ vagrant scp ../ansible vm-projet:/home/vagrant/ansible
    $ vagrant scp ../app vm-projet:/home/vagrant/app
    $ vagrant scp ../data vm-projet:/home/vagrant/data
    $ vagrant scp ../hive vm-projet:/home/vagrant/hive
    $ vagrant scp ../spark vm-projet:/home/vagrant/spark
    - SSH VM
    $ vagrant ssh

vagrant plugin install vagrant-vbguest
vagrant vbguest --do install --no-cleanup







0) Turn down VM
    $ Vagrant halt

And enjoy!








oozie : /opt/mapr/oozie/oozie-4.3.0/bin/oozie job -oozie "http://localhost:11000/oozie" -config hive/hive_job.properties -run


spark-submit : /opt/mapr/spark/spark-2.3.1/bin/spark-submit --class com.exemple.script.App target/project-1.0-SNAPSHOT.jar
