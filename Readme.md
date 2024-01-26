# Setup Guide
<img src="mapr.png" alt="Image 1" style="width: 45%">
<img src="jems.jpeg" alt="Image 2" style="width: 25%;">

This guide provides step-by-step instructions. Follow these steps to ensure a smooth installation process.

## Prerequisites
- MapR 6.1.0 VM is already installed and started.

## 1. Make the user "mapr" a sudoer
```bash
su -
nano /etc/sudoers
```
Add the following line :

```bash
mapr    ALL=(ALL) NOPASSWD: ALL
```

Exit the editor
```bash
exit
```

## 2. Make the user "mapr" a sudoer
```bash
sudo yum-config-manager --save --setopt=MapR_Core.skip_if_unavailable=true
sudo yum-config-manager --save --setopt=MapR_Ecosystem.skip_if_unavailable=true
sudo yum-config-manager --save --setopt=MapR_Installer.skip_if_unavailable=true
```

## 3. Install Ansible
```bash
sudo yum --disablerepo=MapR_Core --disablerepo=MapR_Ecosystem --disablerepo=MapR_Installer install ansible -y
```

## 4. Install Git
```bash
sudo yum --disablerepo=MapR_Core --disablerepo=MapR_Ecosystem --disablerepo=MapR_Installer install ansible -y
```

## 5. Get the application files
```bash
git clone https://github.com/hraouak/projet-jems.git
cd projet-jems
```

## 6. Configure cluster
```bash
ansible-playbook ansible/main.yml
```
Your MapR cluster is now complete. Have a great experience using the application!

## 7. Run the application
```bash
bash app/start_stop.sh
```

## 8. Optional
### Show tickets
```bash
klist
```
### Obtain a new ticket if needed
```bash
echo -e "mapr" | kinit mapr
```

Enjoy!





