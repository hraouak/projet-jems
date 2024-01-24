Here's a step by step guide 

1) VM Creation
    - Add box of MapR
    $ vagrant box add  name-of-your-box.box --name new-box-name --force
	- Init Vagrant
    $ vagrant init
    - Start VM
    $ vagrant up
    - provision vm
    $ vagrant provision
    - SSH VM
    $ vagrant ssh

vagrant plugin install vagrant-vbguest
vagrant vbguest --do install --no-cleanup







0) Turn down VM
    $ Vagrant halt

And enjoy!








oozie : /opt/mapr/oozie/oozie-4.3.0/bin/oozie job -oozie "http://localhost:11000/oozie" -config hive/hive_job.properties -run


spark-submit : /opt/mapr/spark/spark-2.3.1/bin/spark-submit --class com.exemple.script.App target/project-1.0-SNAPSHOT.jar
