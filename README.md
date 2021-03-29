# fil-rouge-aston


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

### Virtual environnement installation for Python3
`sudo apt update && sudo apt install python3-venv`


### Virtual environnement implementation
`cd <app_folder>`
`python3 -m venv venv`

