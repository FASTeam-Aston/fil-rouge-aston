# fil-rouge-aston

### VM's INFORMATIONS
hostname : fil-rouge-aston-5    \
ip : 51.254.227.51              \
user : ubuntu                   \
password : js4f150Q6Uivbr51

user : alex - password : 7Zi23eY6VRuX52us   --> change in personnal passaword     \
user : fred - password : 6psELH9Ze9cdB596        \
user : sof  - password : iQGQjixZbX394672

### update apt
`sudo apt update`

### fail2ban installation
sudo apt install fail2ban

### fail2ban configuration
sudo nano # /etc/fail2ban/jail.d/defaults-debian.conf
### adding configuration
see defaults-debian.conf in infra directory


### Install packages
`sudo apt install whois` #use for mkpasswd
`sudo apt install apt-transport-https ca-certificates curl software-properties-common`

### docker-ce installation
`sudo apt update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install docker-ce`

### Apache installation
sudo apt install apache2

### Add 3 new users with sudo

`sudo useradd -d /home/alex -s /bin/bash -G sudo -p $(openssl passwd -6 -salt xyz 7Zi23eY6VRuX52us) -m alex`

`sudo useradd -d /home/fred -s /bin/bash -G sudo -p $(openssl passwd -6 -salt xyz 6psELH9Ze9cdB596) -m fred`

`sudo useradd -d /home/sof -s /bin/bash -G sudo -p $(openssl passwd -6 -salt xyz iQGQjixZbX394672) -m sof`


### Virtual environnement installation for Python3
`sudo apt update && sudo apt install python3-venv`


### Virtual environnement implementation
`cd <app_folder>`
`python3 -m venv venv`

