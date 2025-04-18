
# 🧪 **Lab 1**

---

## 🎯 **Lab Objectives**

By the end of this lab, you will be able to:

1. Install and configure a Linux server with essential post-installation steps.  
2. Install and manage software using DEB or RPM packages.  
3. Compile and install Apache HTTP Server from source.  
4. Integrate a custom-built Apache with systemd to run it as a service.

---

## 🖥️ **Lab Requirements**

- A Linux VM or machine running:  
  - Ubuntu Server 22.04+ or Debian (for DEB)  
  - OR Fedora/CentOS Stream/AlmaLinux (for RPM)  
- Internet access  
- A user with `sudo` privileges

---

## 🔹 Part 1: Installing Linux and Post-Installation Tasks

### Task 1: Perform Initial Setup

- Set the hostname to `custom-apache`.  
  
```bash
sudo hostnamectl set-hostname custom-apache
```

- Create a regular user named `webadmin` with sudo privileges. 

```bash
sudo adduser webadmin
sudo usermod -aG sudo webadmin
```

- Ensure the system is fully updated.  

```bash
sudo apt update && sudo apt full-upgrade -y
```

- Enable the firewall and allow SSH. 

```bash
sudo sudo apt install ufw -y
sudo ufw enable
sudo ufw allow OpenSSH 
```

- Enable NTP time synchronization.
```bash
timedatectl set-ntp true
timedatectl status
```

---

### Task 2: Create a System-Wide Environment Variable

- Set the environment variable `ENV="lab-production"` in `/etc/environment`.  
- Verify that it loads for all users upon login.

```bash
echo 'ENV=lab-production' | sudo tee -a /etc/environment
# After REboot or login again
echo $ENV
```

---

## 📦 Part 2: Install Software Using the Native Package Manager

### Task 3: Install and Remove Packages


- Install `wget`, `vim`, and `htop` using `apt` or `dnf`.  

```bash
sudo apt install wget vim htop -y
```

- Remove `vim` using the same package manager.

```bash
sudo apt remove vim -y
```

- Document which version of `wget` is installed and from which repo.

```bash
sudo apt show wget | grep -E 'Version|APT-Sources'
```

---

### Task 4: Download and Install a Manual Package

- Download the `.deb` or `.rpm` of `neofetch` from a package archive.
- Install it manually using `dpkg` or `rpm`.  
- Resolve any dependency issues using the appropriate command.  
- Run the software to confirm it's installed.


```bash
wget http://archive.ubuntu.com/ubuntu/pool/universe/n/neofetch/neofetch_3.4.0-1_all.deb
sudo dpkg -i neofetch_3.4.0-1_all.deb
sudo apt install -f -y
neofetch
```


---

## 🧱 Part 3: Compile Apache HTTP Server from Source

### Task 5: Prepare the System for Compilation

- Install all required build dependencies. 
- Create a working directory in `/usr/local/src/apache-lab`.  
- Download the latest stable version of Apache HTTP Server from [https://httpd.apache.org](https://httpd.apache.org).

```bash
sudo apt install build-essential libpcre3-dev libssl-dev -y 
sudo mkdir -p /usr/local/src/apache-lab
cd /usr/local/src/apache-lab

wget https://dlcdn.apache.org/httpd/httpd-2.4.63.tar.gz


sha256sum httpd-2.4.63.tar.gz

## After verification of the hashsum
tar -xvzf httpd-2.4.63.tar.gz
cd httpd-2.4.63
```



---

### Task 6: Compile and Install Apache

- Extract the source code.  
- Run the `configure` script with a custom prefix `/opt/custom-apache`. 

```bash
./configure --prefix="/opt/custom-apache" --enable-ssh
```

- Compile and install the server using `make` and `make install`. 

```bash
make -j 4
sudo make install
```

- Ensure no errors occur during the process.

---

### Task 7: Test the Apache Server

- Start Apache manually using `apachectl`. 

```bash
sudo /opt/custom-apache/bin/apachectl start
```

- Check that it listens on port 80.
- Use `curl` or a browser to test access to the default page.  
- Stop the Apache process.

```bash
sudo netstat -tulnp | grep :80
curl http://localhost
sudo /opt/custom-apache/bin/apachectl stop
```



