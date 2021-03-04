# fil-rouge-aston

### VM's INFORMATIONS
hostname : fil-rouge-aston-5
ip : 51.254.227.51
user: ubuntu
password: js4f150Q6Uivbr51


### update apt
`sudo apt update`

### Install packages
`sudo apt install whois`

### Add 3 new users with sudo

`sudo useradd -d /home/alex -s /bin/bash -G sudo -p $(mkpasswd -H md5 7Zi23eY6VRuX52us) -m alex`

`sudo useradd -d /home/fred -s /bin/bash -G sudo -p $(mkpasswd -H md5 6psELH9Ze9cdB596) -m fred`

`sudo useradd -d /home/sof -s /bin/bash -G sudo -p $(mkpasswd -H md5 iQGQjixZbX394672) -m sof`