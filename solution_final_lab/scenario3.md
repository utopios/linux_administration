# Task1
sudo mkdir -p /srv/projects
sudo chown :developpeurs /srv/projects
sudo chmod 770 /srv/projects

# Task2 

sudo apt install -y acl
sudo setfacl -m u:charlie:r /srv/projects

getafcl /srv/projects

# Task 3

ssh-keygen -t rsa -b 4096
