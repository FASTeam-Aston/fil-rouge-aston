# fil-rouge-aston

### Add 3 new users with sudo

useradd -d /home/alex -s /bin/sh -p $(mkpasswd -H md5 7Zi23eY6VRuX52us) -m alex

useradd -d /home/fred -s /bin/sh -p $(mkpasswd -H md5 6psELH9Ze9cdB596) -m fred

useradd -d /home/sof -s /bin/sh -p $(mkpasswd -H md5 iQGQjixZbX394672) -m sof