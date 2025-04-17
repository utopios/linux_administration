
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
- Create a regular user named `webadmin` with sudo privileges.  
- Ensure the system is fully updated.  
- Enable the firewall and allow SSH.  
- Enable NTP time synchronization.

---

### Task 2: Create a System-Wide Environment Variable

- Set the environment variable `ENV="lab-production"` in `/etc/environment`.  
- Verify that it loads for all users upon login.

---

## 📦 Part 2: Install Software Using the Native Package Manager

### Task 3: Install and Remove Packages

- Install `wget`, `vim`, and `htop` using `apt` or `dnf`.  
- Remove `vim` using the same package manager.  
- Document which version of `wget` is installed and from which repo.

---

### Task 4: Download and Install a Manual Package

- Download the `.deb` or `.rpm` of `neofetch` from a package archive.  
- Install it manually using `dpkg` or `rpm`.  
- Resolve any dependency issues using the appropriate command.  
- Run the software to confirm it's installed.

---

## 🧱 Part 3: Compile Apache HTTP Server from Source

### Task 5: Prepare the System for Compilation

- Install all required build dependencies.  
- Create a working directory in `/usr/local/src/apache-lab`.  
- Download the latest stable version of Apache HTTP Server from [https://httpd.apache.org](https://httpd.apache.org).

---

### Task 6: Compile and Install Apache

- Extract the source code.  
- Run the `configure` script with a custom prefix `/opt/custom-apache`.  
- Compile and install the server using `make` and `make install`.  
- Ensure no errors occur during the process.

---

### Task 7: Test the Apache Server

- Start Apache manually using `apachectl`.  
- Check that it listens on port 80.  
- Use `curl` or a browser to test access to the default page.  
- Stop the Apache process.

