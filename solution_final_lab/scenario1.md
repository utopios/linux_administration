# Task 1

## Create group
sudo groupadd developpeurs

## Create users and add them to the group
sudo useradd -m -s /bin/bash -G developpeurs alice
sudo useradd -m -s /bin/bash -G developpeurs bob

## Set passwords for users
sudo passwd alice
sudo passwd bob

# Task 2
sudo apt update
sudo apt install -y git nginx
sudo curl -fsSL https://get.docker.com -o install-docker.sh
sudo chmod +x install-docker.sh
sudo ./install-docker.sh


# Task 3
sudo apt install -y ufw
sudo sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config
sudo systemctl restart ssh

sudo ufw allow 2222/tcp
sudo ufw allow 80/tcp
sudo ufw allow 3000/tcp

sudo ufw default deny incoming
sudo ufw enable
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
echo "AllowUsers devadmin alice" | sudo tee -a /etc/ssh/sshd_config

sudo systemctl restart ssh

sudo useradd -m -s /bin/bash devadmin
sudo passwd devadmin
sudo mkdir /home/devadmin/.ssh
sudo nano /home/devadmin/.ssh/authorized_keys
sudo chmod 700 /home/devadmin/.ssh
sudo chmod 600 /home/devadmin/.ssh/authorized_keys
sudo chown -R devadmin:devadmin /home/devadmin/.ssh


# Task 4

sudo useradd -r -m -U -d /home/git -s /bin/bash git
wget -O gitea https://dl.gitea.com/gitea/1.23.7/gitea-1.23.7-linux-amd64
chmod +x gitea 
sudo mv gitea /usr/local/bin/

sudo mkdir -p /var/lib/gitea/{custom,data,log}
sudo chown -R git:git /var/lib/gitea/
sudo chmod -R 750 /var/lib/gitea/
sudo mkdir /etc/gitea
sudo chown root:git /etc/gitea
sudo chmod 770 /etc/gitea

sudo nano /etc/systemd/system/gitea.service

```
[Unit]
Description=Gitea
After=network.target

[Service]
User=git
Group=git
WorkingDirectory=/var/lib/gitea/
ExecStart=/usr/local/bin/gitea web --config /etc/gitea/app.ini
Restart=always
Environment=USER=git HOME=/home/git

[Install]
WantedBy=multi-user.target
```

sudo systemctl daemon-reload
sudo systemctl enable gitea
sudo sysyemctl start gitea