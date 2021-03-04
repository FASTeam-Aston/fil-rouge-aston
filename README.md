# fil-rouge-aston

### VM's INFORMATIONS
hostname : fil-rouge-aston-5    \
ip : 51.254.227.51              \
user : ubuntu                   \
password : js4f150Q6Uivbr51

user : alex - password : 7Zi23eY6VRuX52us        \
user : fred - password : 6psELH9Ze9cdB596        \
user : sof  - password : iQGQjixZbX394672

### update apt
`sudo apt update`

### Install packages
`sudo apt install whois` #use for mkpasswd

### Add 3 new users with sudo

`sudo useradd -d /home/alex -s /bin/bash -G sudo -p $(mkpasswd -H md5 7Zi23eY6VRuX52us) -m alex`

`sudo useradd -d /home/fred -s /bin/bash -G sudo -p $(mkpasswd -H md5 6psELH9Ze9cdB596) -m fred`

`sudo useradd -d /home/sof -s /bin/bash -G sudo -p $(mkpasswd -H md5 iQGQjixZbX394672) -m sof`


### Python version test
`python3 --version`
--> Python 3.8.5

### Install Flask
`pip install Flask`

### Install vitualenv
`sudo apt-get install python-virtualenv`
